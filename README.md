# Fireplace

*Offline playback of a fireplace video on your Apple TV*

![Swift](https://img.shields.io/badge/swift-5.5-orange.svg)
![Xcode](https://img.shields.io/badge/xcode-13.1-brightgreen.svg)
![Platform](https://img.shields.io/badge/platform-appleTV-lightgrey.svg)
![OS](https://img.shields.io/badge/tvOS-15.0-yellow.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## Screenshots

![screenshot1](/images/screenshot_1.png?raw=true "Screenshot 1")

![screenshot2](/images/screenshot_2.png?raw=true "Screenshot 1")

## Bring Your Own Video

For copyright reasons the file `fire.mp4` is not included. It can be supplied for example in the following way:

- Search for *"fireplace 4k"* on YouTube, choose a video
- Show video and audio formats and file sizes `youtube-dl https://www.youtube.com/watch\?v\=Ux8xAuQBdkk --list-formats`
- Choose a video of acceptable size
- Download it `youtube-dl https://www.youtube.com/watch\?v\=Ux8xAuQBdkk --format 137 --output video.m4v`
- Choose an audio track of acceptable size
- Download it `youtube-dl https://www.youtube.com/watch\?v\=Ux8xAuQBdkk --format 140 --output audio.m4a`
- Combine them `ffmpeg -i video.m4v -i audio.m4a -c:v copy -c:a copy fire.mp4`
- Drag & drop the resulting file `fire.mp4` into Xcode and add it as an asset that is bundled on build
    - Project -> Build Phases -> Copy Bundle Resources -> `fire.mp4` must appear in the list

## Resources

- [Source for video player code](https://stackoverflow.com/questions/25348877/how-to-play-a-local-video-with-swift)
- [Apple's Sketch template for tvOS assets](https://developer.apple.com/design/resources/#tvos-apps)
- [Blog post on other image asset usage](https://support.zype.com/hc/en-us/articles/221132148-Apple-TV-App-Images)

## TODO

- Loop video when end is reached
