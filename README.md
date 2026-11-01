# RAJ GAMING OFFICIAL — Android starter

This package contains the first Flutter UI prototype and a GitHub Actions workflow
that can compile a release APK in the cloud.

## Included in this stage
- HOME, NEW, SHOP and PROFILE navigation
- Dark and Light appearance toggle
- English and Kiswahili language toggle
- Sample update cards and shop items
- Cloud APK build workflow (`.github/workflows/android-apk.yml`)

## Important: this is NOT the complete online product yet
The following still need to be implemented and configured:
- Real sign-up/login and account recovery
- Admin-only posting and file management
- Cloud database and media/file storage
- Real likes, comments and notifications
- Paid/free download entitlements and resumable downloads
- Payment provider integration and verified payment callbacks
- Wallet/withdrawal features subject to provider and regulatory requirements
- Production security rules, privacy policy and testing

## Build an APK using GitHub Actions
1. Create a GitHub account and a new repository named `raj-gaming-official`.
2. Upload the contents of this folder to the repository's `main` branch.
3. Open the repository's **Actions** tab.
4. Select **Build RAJ GAMING OFFICIAL APK** and choose **Run workflow** (or wait for the first push build).
5. When the workflow finishes, open the run and download the `raj-gaming-official-apk` artifact.
6. Extract the downloaded ZIP to get `app-release.apk`, then install it on your Android phone.

The workflow uses GitHub-hosted build machines; Flutter/Android SDK are not required on your phone.
