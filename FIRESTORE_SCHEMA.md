Firestore data model for portfolio_app (versioned under `portfolio/v1`)

Collections and documents

- `portfolio` (collection)
  - `v1` (document)
    - `meta` (subcollection)
      - `about` (doc)
        - `summary`: string
      - `contact` (doc)
        - `name`: string
        - `title`: string
        - `subtitle`: string
        - `phone`: string
        - `email`: string
        - `github`: string (URL)
        - `linkedin`: string (URL)
    - `experiences` (subcollection)
      - autoId or slug (doc)
        - `order`: number
        - `company`: string
        - `position`: string
        - `duration`: string
        - `description`: string
    - `skills` (subcollection)
      - autoId or slug (doc)
        - `order`: number
        - `name`: string
        - `category`: string
        - `description`: string
    - `projects` (subcollection)
      - autoId or slug (doc)
        - `order`: number
        - `name`: string
        - `description`: string
        - `technologies`: string
        - `githubUrl`: string (optional)
        - `liveUrl`: string (optional)

Security rules (public read, write restricted)

service cloud.firestore {
  match /databases/{database}/documents {
    match /portfolio/{version} {
      allow read: if true; // Read-only public
      allow write: if request.auth != null && request.auth.uid != null; // Authenticated writes

      match /{document=**} {
        allow read: if true;
        allow write: if request.auth != null && request.auth.uid != null;
      }
    }
  }
}

