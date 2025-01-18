# Mini Ecommerce Flutter App

## How to Run the App

To get started with running the Mini Ecommerce Flutter App, follow these steps:

1. **Clone the Repository**:
   - Clone the project repository to your local machine using:
     ```bash
     git clone <repository-link>
     ```
   - Replace `<repository-link>` with the actual link to the repository.

2. **Navigate to the Project Directory**:
   ```bash
   cd mini_ecommerce_flutter_app
   ```

3. **Install Dependencies**:
   - Run the following command to fetch the necessary dependencies:
     ```bash
     flutter pub get
     ```

4. **Run the App**:
   - Connect your device or start an emulator.
   - Use the command:
     ```bash
     flutter run
     ```

5. **Login Details**:
   - Use the following credentials to log in to the app:
     - **Email**: admin@test.com
     - **Password**: admin123

---

## Overall Architecture and Libraries Used

The app is built following the **MVVM (Model-View-ViewModel)** architecture to ensure clean code separation and scalability. Here's a brief overview:

### Architecture:
- **Model**: Represents the data layer and handles API interactions.
- **View**: Comprises UI components, which are updated based on changes in the state.
- **ViewModel**: Acts as a bridge between the View and Model, handling business logic and state management.

### Libraries Used:
1. **Riverpod**: Used for state management to ensure a reactive and maintainable app structure.
2. **Dio**: For making HTTP requests and interacting with the REST API.
3 **MVVM**: Uses MVVM archeticture to make sure that app is easily maintainable and scalable
4. **Flutter Material Widgets**: Used to build the UI following Material Design principles.

---
