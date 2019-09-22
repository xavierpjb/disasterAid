# CornellHack
Inventory distribution/ item needs after disaster

To build container
gcloud builds submit --tag gcr.io/distaster-aid/helloworld

To deploy
gcloud beta run deploy --image gcr.io/distaster-aid/helloworld --platform managed
