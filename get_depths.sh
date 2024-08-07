CUDA_VISIBLE_DEVICES=1 python train_emernerf.py --config_file configs/default_dynamic.yaml \
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

CUDA_VISIBLE_DEVICES=1 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam1_offset1m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam1_new/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_1m \
data.lidar_source.test_folder=offset_left_1m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1

CUDA_VISIBLE_DEVICES=1 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam1_offset2m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_2m \
data.lidar_source.test_folder=offset_left_2m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1

CUDA_VISIBLE_DEVICES=1 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam1_offset4m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam1/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_4m \
data.lidar_source.test_folder=offset_left_4m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=1

# cam 3
CUDA_VISIBLE_DEVICES=1 python train_emernerf.py --config_file configs/default_dynamic.yaml \
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

CUDA_VISIBLE_DEVICES=1 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam3_offset1m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam3_new/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_1m \
data.lidar_source.test_folder=offset_left_1m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3

CUDA_VISIBLE_DEVICES=1 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam3_offset2m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam3_new/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_2m \
data.lidar_source.test_folder=offset_left_2m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3

CUDA_VISIBLE_DEVICES=0 python train_emernerf.py --config_file configs/default_dynamic.yaml \
--output_root out --project emernerf_carla --run_name debug_lidar_Town04_cam3_offset4m \
--eval_only \
resume_from=out/emernerf_carla/debug_lidar_Town04_cam3_new/checkpoint_25000.pth \
data.data_root=all_data \
data.scene_idx=carla_pic_0603_Town04 \
data.pixel_source.test_folder=offset_left_4m \
data.lidar_source.test_folder=offset_left_4m \
data.dataset=ours \
data.pixel_source.test_image_stride=5 \
data.start_timestep=0 \
data.end_timestep=148 \
data.pixel_source.num_cams=3