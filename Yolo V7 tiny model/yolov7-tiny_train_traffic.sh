#!/bin/bash

# 定義版本號變數
PRE_VERSION="1.0.53"
VERSION="1.0.54"

# 保存當前目錄
original_dir=$(pwd)
# 移動到指定目錄
cd /training_sets/TRAFFIC/ || exit 1 # 如果目錄不存在，則退出腳本
# 在新目錄中執行一些操作
echo "現在位於：$(pwd)"
# 分割資料
python3 /training_sets/TRAFFIC/SNIPPET_gen_Traffic_Tiny_${VERSION}.py
# 返回原來的目錄
cd "$original_dir" || exit 1
# 確認返回
echo "返回原來的目錄：$(pwd)"


# 檔案列表
FILES=(
    "/training_sets/TRAFFIC/train_Traffic_Tiny.cache"
    "/training_sets/TRAFFIC/valid_Traffic_Tiny.cache"
)
# 迴圈檢查和刪除檔案
for FILE in "${FILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo "Deleting $FILE"
        rm "$FILE"
        echo "File deleted successfully."
    else
        echo "File does not exist: $FILE"
    fi
done
echo "請按 Enter 鍵繼續..."
read
echo "繼續執行..."

# 重新計算 anchor
python3 calculate_anchor.py --path data/traffic.yaml
echo "請將 anchor 填入 .cfg file 後繼續，請按 Enter 鍵繼續..."
read
echo "繼續執行..."

# 開始訓練
python train.py --workers 8 --device 0 \
    --batch-size 64 \
    --data data/traffic.yaml \
    --img 640 640 \
    --cfg cfg/training/traffic.yaml \
    --weights "/yolov7/runs/train/traffic_v7-tiny_${PRE_VERSION}/weights/last.pt" \
    --name "traffic_v7-tiny_${VERSION}" \
    --hyp data/hyp.scratch.custom_traffic.yaml \
    --epochs 300


# # resume
# python train.py --workers 8 --device 0 \
#     --batch-size 64 \
#     --data data/traffic.yaml \
#     --img 640 640 \
#     --cfg cfg/training/traffic.yaml \
#     --weights "/yolov7/runs/train/traffic_v7-tiny_${VERSION}/weights/last.pt" \
#     --name "traffic_v7-tiny_${VERSION}" \
#     --hyp data/hyp.scratch.custom_traffic.yaml \
#     --epochs 300 \
#     --resume












































































































# #!/bin/bash

# # 保存當前目錄
# original_dir=$(pwd)

# # 移動到指定目錄
# cd /training_sets/TRAFFIC/ || exit 1 # 如果目錄不存在，則退出腳本

# # 在新目錄中執行一些操作
# echo "現在位於：$(pwd)"

# # 分割資料
# python3 /training_sets/TRAFFIC/SNIPPET_gen_Traffic_Tiny_1.0.52.py

# # 返回原來的目錄
# cd "$original_dir" || exit 1

# # 確認返回
# echo "返回原來的目錄：$(pwd)"

# # 檔案列表
# FILES=(
#     "/training_sets/TRAFFIC/train_Traffic_Tiny.cache"
#     "/training_sets/TRAFFIC/valid_Traffic_Tiny.cache"
# )

# # 迴圈檢查和刪除檔案
# for FILE in "${FILES[@]}"; do
#     if [ -f "$FILE" ]; then
#         echo "Deleting $FILE"
#         rm "$FILE"
#         echo "File deleted successfully."
#     else
#         echo "File does not exist: $FILE"
#     fi
# done

# echo "請按 Enter 鍵繼續..."
# read
# echo "繼續執行..."








# # 重新計算 anchor
# python3 calculate_anchor.py --path data/traffic.yaml

# echo "請將 anchor 填入 .cfg file 後繼續，請按 Enter 鍵繼續..."
# read
# echo "繼續執行..."








# # 開始訓練
# python train.py --workers 8 --device 0 \
#     --batch-size 128 \
#     --data 'data/traffic.yaml' \
#     --img 640 640 \
#     --cfg 'cfg/training/traffic.yaml' \
#     --weights 'runs/train/old/yolov7-tiny_traffic_20241227/weights/last.pt' \
#     --name traffic_v7-tiny_1.0.52 \
#     --hyp data/hyp.scratch.custom_traffic.yaml \
#     --epochs 300

# # # resume
# # python train.py --workers 8 --device 0 \
# #     --batch-size 128 \
# #     --data 'data/traffic.yaml' \
# #     --img 640 640 \
# #     --cfg 'cfg/training/traffic.yaml' \
# #     --weights 'runs/train/traffic_v7-tiny_1.0.52/weights/last.pt' \
# #     --name traffic_v7-tiny_1.0.52 \
# #     --hyp data/hyp.scratch.custom_traffic.yaml \
# #     --epochs 300
# #     --resume
