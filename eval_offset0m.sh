CUDA_VISIBLE_DEVICES=7 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town01_cam1_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town01_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town01 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1 \\

CUDA_VISIBLE_DEVICES=6 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town02_cam1_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town02_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town02 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1 \\

CUDA_VISIBLE_DEVICES=5 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town03_cam1_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town03_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town03 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1 \\

CUDA_VISIBLE_DEVICES=4 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam1_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1

CUDA_VISIBLE_DEVICES=7 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town05_cam1_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town05_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town05 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1 \\

CUDA_VISIBLE_DEVICES=6 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town10_cam1_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town10_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town10 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1 

# train cam3
CUDA_VISIBLE_DEVICES=4 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town01_cam3_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town01_cam3/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town01 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3 \\

CUDA_VISIBLE_DEVICES=4 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town02_cam3_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town02_cam3/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town02 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3 \\

CUDA_VISIBLE_DEVICES=4 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town03_cam3_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town03_cam3/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town03 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3 \\

CUDA_VISIBLE_DEVICES=4 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam3_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam3/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3

CUDA_VISIBLE_DEVICES=4 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town05_cam3_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town05_cam3/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town05 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3 \\

CUDA_VISIBLE_DEVICES=4 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town10_cam3_offset0m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town10_cam3/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town10 \
data.pixel_source.test_folder=offset_left_0m \
data.lidar_source.test_folder=offset_left_0m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3 