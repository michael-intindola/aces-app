# aces-app-dev

Aces is a mobile-first platform that enables brand-specific ambassadors (or “Aces”) to collaborate with one another and create content that would further endorse the brand and generate more brand awareness. Fans of the brand can engage with the community by viewing/supporting the Ace’s content, attending local events, etc. Initially, the content that an Ace can create and share will be photos, videos, or blog posts. Brand Administrators could customize the “look and feel” of the app, approve “Aces” to become content creators/contributers, create events

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.
