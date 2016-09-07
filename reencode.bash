#!/bin/bash -e

MEDIA_FACTORY_API=https://media-factory.dev.nyt.net

payload='{"metadata":{"presets":["reencode_1080p_hls","reencode_240p_hls","reencode_360p_hls","reencode_480p_hls","reencode_720p_hls","reencode_1080p_mp4","reencode_144p_mp4","reencode_240p_mp4","reencode_360p_mp4","reencode_480p_mp4","reencode_720p_mp4","reencode_240p_webm","reencode_360p_webm","reencode_480p_webm","reencode_720p_webm"],"slug":"reencode-test","createDate":"2016-09-06 16:46:31.0"},"externalId":"42404"}'

job_id=$(curl -sXPOST -d "$payload" $MEDIA_FACTORY_API/jobs | jq -r '.jobId')
curl -sd '{"source":"s3://nyt-video-acquisition-api-dev/reencode/42404_1_out-there-osiris-rex_wg_hd_synd.mov"}' -XPOST ${MEDIA_FACTORY_API}/jobs/${job_id}/start | jq
