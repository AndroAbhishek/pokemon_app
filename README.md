# Pokémon App

## Introduction

**Pokémon App** is a Flutter-based application designed to display a collection of Pokémon cards with advanced features like search, pagination, and detailed views. The application uses modern Flutter libraries and practices to provide a seamless user experience. 

This app is built with a focus on scalability, responsiveness, and performance, adhering to best practices for state management and API integration.

---

## Features

### **1. Pokémon Card List with Search**
- **Search API**: Utilizes `https://api.pokemontcg.io/v2/cards` for fetching Pokémon card data.
- Real-time search functionality to filter cards by set names or other criteria.
- Paginated grid view to display cards, enabling infinite scroll for smooth navigation.

### **2. Interactive Card Detail Page**
- Tap on any card to view detailed information like:
  - Attack
  - Set
  - Type
  - Weakness
  - Artist and more.
- Includes animations for transitions between screens for enhanced UX.

### **3. App Bar with Search Text Box**
- A responsive search bar integrated into the App Bar for a consistent and user-friendly design.

### **4. Paginated Grid View**
- Displays cards in a **2x2 grid layout** for better visual organization.
- Infinite scrolling powered by advanced pagination techniques.
- Supports pull-to-refresh for effortless data updates.

### **5. App Routing**
- Clean routing system to manage navigation across the app using named routes for scalability.

---

## Tech Stack

### **Key Features Used**
- **BLoC Architecture**: For clean and scalable state management.
- **Dependency Injection (GetIt)**: Simplifies object creation and dependency management.
- **Dio Library**: For robust API handling with caching, error handling, and optimized network calls.
- **Image Caching**: Ensures images load quickly and efficiently, even on repeated views.
- **Pagination**: Dynamic data loading with smooth infinite scrolling experience.

---

## Advanced Capabilities

### **Architecture-Agnostic**
- Works seamlessly with any state management approach, including `BLoC`, or `GetX`.

### **Layout-Agnostic**
- Customizable widgets like `GridView` and `ListView`, with support for separators and custom layouts.

### **API-Agnostic**
- Complete control over API calls, supporting any pagination or data-fetching strategy.

### **Highly Customizable**
- Easily adaptable UI elements with options to personalize progress indicators, error screens, and empty states.

### **Extensible**
- Built-in support for pull-to-refresh, sorting, filtering, and search for a comprehensive UX.

### **State Listening**
- Responsive to state changes with support for displaying dialogs, snackbars, or executing custom actions.

---

## API Integration

1. **List Cards**
   - Endpoint: `https://api.pokemontcg.io/v2/cards?page=1&pageSize=10`
   - Fetch paginated Pokémon card data with caching for improved performance.

2. **Search Cards**
   - Endpoint: `https://api.pokemontcg.io/v2/cards?q=set.name:generations`
   - Dynamic search query integration.

---

Happy coding with **Pokémon App**! 🚀
