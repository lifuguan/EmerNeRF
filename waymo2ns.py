#%%
import os
import numpy as np
import imageio.v2 as imageio
import cv2
from tqdm import tqdm
import json
import open3d as o3d
def downsample_gaussian_blur(img, ratio):
    sigma = (1 / ratio) / 3
    # ksize=np.ceil(2*sigma)
    ksize = int(np.ceil(((sigma - 0.8) / 0.3 + 1) * 2 + 1))
    ksize = ksize + 1 if ksize % 2 == 0 else ksize
    img = cv2.GaussianBlur(img, (ksize, ksize), sigma, borderType=cv2.BORDER_REFLECT101)
    return img
    
    
ORIGINAL_SIZE = [[1280, 1920], [1280, 1920], [1280, 1920], [884, 1920], [884, 1920]]
OPENCV2DATASET = np.array(
    [[0, 0, 1, 0], [-1, 0, 0, 0], [0, -1, 0, 0], [0, 0, 0, 1]]
)

folder_path = os.path.join('data/waymo/processed/training')
num_cams, camera_list =3, [1, 0, 2]

image_size = (176, 240)

start_timestep, end_timestep = 0, 198

scenes = ['019']

def load_calibrations(scene_path):
    """
    Load the camera intrinsics, extrinsics, timestamps, etc.
    Compute the camera-to-world matrices, ego-to-world matrices, etc.
    """
    # to store per-camera intrinsics and extrinsics
    _intrinsics = []
    cam_to_egos = []
    for i in range(num_cams):
        # load camera intrinsics
        # 1d Array of [f_u, f_v, c_u, c_v, k{1, 2}, p{1, 2}, k{3}].
        # ====!! we did not use distortion parameters for simplicity !!====
        # to be improved!!
        intrinsic = np.loadtxt(
            os.path.join(scene_path, "intrinsics", f"{i}.txt")
        )
        fx, fy = intrinsic[0], intrinsic[1]
        # scale intrinsics w.r.t. load size
        fx, fy = (
            fx * image_size[1] / ORIGINAL_SIZE[i][1],
            fy * image_size[0] / ORIGINAL_SIZE[i][0],
        )
        cx, cy = (image_size[1] // 2, image_size[0] // 2)
        intrinsic = np.array([fx, fy, cx, cy])
        _intrinsics.append(intrinsic)

        # load camera extrinsics
        cam_to_ego = np.loadtxt(
            os.path.join(scene_path, "extrinsics", f"{i}.txt")
        )
        # because we use opencv coordinate system to generate camera rays,
        # we need a transformation matrix to covnert rays from opencv coordinate
        # system to waymo coordinate system.
        # opencv coordinate system: x right, y down, z front
        # waymo coordinate system: x front, y left, z up
        cam_to_egos.append(cam_to_ego @ OPENCV2DATASET)

    # compute per-image poses and intrinsics
    cam_to_worlds, ego_to_worlds = [], []
    intrinsics, cam_ids = [], []
    # ===! for waymo, we simplify timestamps as the time indices
    timestamps, timesteps = [], []

    # we tranform the camera poses w.r.t. the first timestep to make the translation vector of
    # the first ego pose as the origin of the world coordinate system.
    ego_to_world_start = np.loadtxt(
        os.path.join(scene_path, "ego_pose", f"{start_timestep:03d}.txt")
    )
    for t in range(start_timestep, end_timestep):
        ego_to_world_current = np.loadtxt(
            os.path.join(scene_path, "ego_pose", f"{t:03d}.txt")
        )
        # compute ego_to_world transformation
        ego_to_world = np.linalg.inv(ego_to_world_start) @ ego_to_world_current
        ego_to_worlds.append(ego_to_world)
        for cam_id in camera_list:
            cam_ids.append(cam_id)
            # transformation:
            #   (opencv_cam -> waymo_cam -> waymo_ego_vehicle) -> current_world
            cam2world = ego_to_world @ cam_to_egos[cam_id]
            cam_to_worlds.append(cam2world)
            intrinsics.append(_intrinsics[cam_id])
            # ===! we use time indices as the timestamp for waymo dataset for simplicity
            # ===! we can use the actual timestamps if needed
            # to be improved
            timestamps.append(t - start_timestep)
            timesteps.append(t - start_timestep)

    intrinsics = np.stack(intrinsics, axis=0)
    cam_to_worlds = np.stack(cam_to_worlds, axis=0)
    return intrinsics, cam_to_worlds

for i, scene in enumerate(scenes):
    scene_path = os.path.join(folder_path, scene)
    
    rgb_files = []
    for t in tqdm(range(start_timestep, end_timestep)):
        for cam_idx in camera_list:
            # rgb = imageio.imread(os.path.join(scene_path, "images", f"{t:03d}_{cam_idx}.jpg")).astype(np.float32)
            # out_h, out_w = image_size[0], image_size[1]
            # h, w = rgb.shape[:2]
            # ratio_y = out_h / h
            # rgb = cv2.resize(downsample_gaussian_blur(
            #     rgb, ratio_y), (out_w, out_h), interpolation=cv2.INTER_LINEAR)
            # rgb_file = os.path.join(scene_path, "images_8", f"{t:03d}_{cam_idx}.jpg")
            # imageio.imwrite(rgb_file, rgb.astype(np.uint8))
            rgb_files.append(os.path.join("images_8", f"{t:03d}_{cam_idx}.jpg"))
    
    intrinsics, c2w_mats = load_calibrations(scene_path)

    np.save(scene_path + "/c2w_mats.npy", c2w_mats)
    # file = {"frames": []}
    # for rgb_file, intrinsic, c2w_mat in zip(rgb_files, intrinsics, c2w_mats):
    #     frame = {
    #         "file_path": rgb_file,
    #         "transform_matrix": c2w_mat.tolist(),
    #         "fl_x": intrinsic[0],
    #         "fl_y": intrinsic[1],
    #         "cx": intrinsic[2],
    #         "cy": intrinsic[3],
    #         "w" : image_size[1],
    #         "h" : image_size[0],
    #     }
    #     file["frames"].append(frame)
        
    # json_data = json.dumps(file)
    # with open(os.path.join(scene_path, "transforms.json"), "w") as json_file:
    #     json_file.write(json_data)
# %%
# %env OPEN3D_CPU_RENDERING true  # Ubuntu 18.04
# import numpy as np
# import open3d as o3d
# from open3d.web_visualizer import draw
# cube_red = o3d.geometry.TriangleMesh.create_box(1, 2, 4)
# cube_red.compute_vertex_normals()
# cube_red.paint_uniform_color((1.0, 0.0, 0.0))
# draw(cube_red)
# # %%

# %%

