INPUT1=game1.mp4
INPUT2=1hrsync.mp4
INPUT3=sync1.mp4
INPUT4=game2.mp4

ffmpeg \
-i $INPUT1 -i $INPUT2 -i $INPUT3 -i $INPUT4 \
-filter_complex \
"[0:v][1:v]hstack=inputs=2[top]; \
[2:v][3:v]hstack=inputs=2[bottom]; \
[top][bottom]vstack=inputs=2[v]" \
-map "[v]" \
finalOutput.mp4

ffmpeg -re -i finalOutput.mp4 -c copy -f flv rtmp://video.stage.nfhsnetwork.com/manual/bdc8281f119dd