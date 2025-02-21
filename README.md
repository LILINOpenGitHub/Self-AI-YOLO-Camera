# Self-AI-YOLO-Camera

The purpose of the site is for a developer, look for self-trained YOLO camera.  You are able to train Yolo V3 tiny AI model and upload it to LILIN 7 series AI IP camera.

## What is Self-trained AI YOLO Camera
First visit LILIN AI Cloud [here](https://ai.meritlilin.com.tw/) for Self-trained AI YOLO Camera.  Your YOLO weight/model can be converted at the cloud for the running of LILIN 7 series AI IP camera.

## Train your YOLO AI dataset
Please use this [CFG file](https://github.com/LILINOpenGitHub/Self-AI-YOLO-Camera/blob/main/Yolo%20V3%20tiny%20model/GYNet_Traffic_Tiny_CFG_1.0.6.cfg) for training your AI dataset

## Upload your YOLO weight/model for conversion
After you have done the YOLO training for your dataset, upload these files:

Your YOLO CFG file (*.cfg) is required. <BR>
Your YOLO object list file (*.names) is required. <BR>
Your YOLO weights file (*.weights) is required. <BR>
Your partial training images (*.jpg) are required. <BR>
Your partial training corresponding labels (*.txt) are required. <BR>
Your logo(32 * 32) (*.png) is optional. <BR>
<BR>
  
## Give it a try
Use this [Yolo weight](https://www.dropbox.com/sh/ono4g4yfbdje48n/AACV56MMq7jEgcl7fv0W726Oa?dl=0) for testing the AI cloud.
  
![image](https://github.com/LILINOpenGitHub/Self-AI-YOLO-Camera/blob/main/images/conversion.jpg)

## License unlocking key
The purpose of the lincense unlocking key is to protect your AI model.  When your customer use the camera with your AI model, the customer has to enter the license key for unlocking purpose.
![image](https://github.com/LILINOpenGitHub/Self-AI-YOLO-Camera/blob/main/images/license1.jpg)
## Download the converted firmware
After the cloud has finished the YOLO weight conversion for the camera, download the bin (firmware) file and upload to the IP camera.
<BR>
<BR>
![image](https://github.com/LILINOpenGitHub/Self-AI-YOLO-Camera/blob/main/images/pic04.jpg)
## Upload the converted firmware into the camera via firmware upgrade
Use LILIN IPScan software to find the camera and perform firmware upgrade.
<BR>
<BR>
![image](https://github.com/LILINOpenGitHub/Self-AI-YOLO-Camera/blob/main/images/pic03.jpg)
## Firmware & AI model encryptions
![image](https://github.com/LILINOpenGitHub/Self-AI-YOLO-Camera/blob/main/images/pic10en.jpg)
  
## Weight/model encryption and protection for intellective property protection
Since your AI weight/model is an important intellective property for you or your company, the AI weight/model is encrypted and protected by AES256 for your AI weight on LILIN AI cloud during the weight/model conversion.
  
## AI firmware encryption and protection for cyber security
Cyber security is an important topic for all the IoT products, unencrypted firmware can lead to injection of Trojan virus, to steal password, or to become a DDoS attacking device.  LILIN AI Cloud also produces the encrypted AI firmware running on LILIN 7 series camera. 

## How to train your model
### YOLO v3 tiny
```
./darknet detector train data/GYNet_${PROJ}_Data_$VERSION.data cfg/GYNet_${PROJ}_CFG_$VERSION.cfg yolov3-tiny.conv.15 -map
```

### YOLO v7 tiny
```
python train.py --workers 8 --device 0 \
    --batch-size 64 \
    --data data/traffic.yaml \
    --img 640 640 \
    --cfg cfg/training/traffic.yaml \
    --weights "/yolov7/runs/train/traffic_v7-tiny_${VERSION}/weights/last.pt" \
    --name "traffic_v7-tiny_${VERSION}" \
    --hyp data/hyp.scratch.custom_traffic.yaml \
    --epochs 300 \
    --resume
```


