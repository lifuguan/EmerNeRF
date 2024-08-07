import os
import imageio
import numpy as np
from PIL import Image
for exp_path in ['out/emernerf_carla/debug_lidar_Town01_cam1','out/emernerf_carla/debug_lidar_Town01_cam3','out/emernerf_carla/debug_lidar_Town04_cam1','out/emernerf_carla/debug_lidar_Town04_cam3']:
    for offset in ['_offset0m','_offset1m','_offset2m','_offset4m']:
        out_dir = os.path.join(exp_path+offset,'full_images')
        path_fn = lambda x: os.path.join(out_dir, x)
        video_rgb_pred = [] 
        video_depth_pred = []
        # for idx in range(30):
        #     path_fn(f'color_{idx:03d}.png')
        #     path_fn(f'distance_mean_{idx:03d}.png')
        #     image = np.array(Image.open(path_fn(f'color_{idx:03d}.png')))
        #     depth = np.array(Image.open(path_fn(f'distance_mean_{idx:03d}.png')))

        with imageio.get_writer(path_fn('video_rgb_pred.mp4'), fps=30) as writer:
            for idx in range(30):
                image = np.array(Image.open(path_fn(f'only_rgb_{idx:03d}.png')))
                writer.append_data(image)
        with imageio.get_writer(path_fn('video_depth_pred.mp4'), fps=30) as writer:
            for idx in range(30):
                path_fn(f'distance_mean_{idx:03d}.png')
                depth = np.array(Image.open(path_fn(f'only_depth_{idx:03d}.png')))
                writer.append_data(depth)


        #     video_rgb_pred.append(image)
        #     video_depth_pred.append(depth)

        
        # imageio.mimwrite(path_fn('video_rgb_pred.mp4'), video_rgb_pred)
        # imageio.mimwrite(path_fn('video_depth_pred.mp4'), video_rgb_pred)