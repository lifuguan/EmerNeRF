# Run EmerNeRF on XLD dataset

## File Tree
```bash
eval_offset0m.sh
get_depths.sh
train.sh
out
├── 
all_data
├── carlc_pic_0603_Town0N
├── ...

```

## 🚀 Start up
##### 1. Using VSCode's `launch.json`
Follows the provided `launch.json` to run the trianing script.
```json
{
    "name": "train 1 cam",
    "type": "debugpy",
    "request": "launch",
    "program": "${workspaceFolder}/train_emernerf.py",
    "console": "integratedTerminal",
    "env": {
        "CUDA_VISIBLE_DEVICES": "7"
    },
    "args": [
        "--config_file",
        "configs/default_dynamic.yaml",
        "--output_root",
        "out",
        "--project",
        "emernerf_carla",
        "--run_name",
        "debug_lidar",
        "data.data_root=all_data",
        "data.scene_idx=carla_pic_0603_Town01", //使用该数据集
        "data.dataset=ours",
        "data.pixel_source.test_folder=offset_left_0m",
        "data.lidar_source.test_folder=offset_left_0m",
        "data.pixel_source.test_image_stride=5", //划分训练集测试集
        // "data.scene_idx=0147030",
        "data.start_timestep=0",
        "data.end_timestep=148",
        "data.pixel_source.num_cams=1",
        // "logging.saveckpt_freq=50000",
        // "optim.num_iters=50000",
        // "logging.vis_freq=200"
    ]
},
```
##### 2. Run on the terminal
`bash train.sh`.