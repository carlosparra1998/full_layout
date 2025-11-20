# Full Layout - Flutter CLEAN ARCH Project Generator 🚀🚀🚀

`Current Full Layout CLI version: 1.1.0`

`Flutter version: a.a.a.a`

`Dart version: a.a.a.a`

CLI to generate a complete Flutter project with CLEAN ARCHITECTURE.

It will allow the developer to create a base project with CLEAN ARCHITECTURE. In this architecture, we use services (Cubits) for each use case. These services will communicate with repositories (for each use case), and these repositories will communicate with the DIO client (HTTP).

- In this layout, BLoC and Cubit are used for state management. 
- DIO is used for communication with the REST API. 
- l10n is used for translations.
- Real use case in full operation (Auth - login)
- Basic responsive design management
- Route management with GET
- Defined styles (text styles and colours)
- Complete initialiser in Splash Screen
- Predefined tests (unit, integration and widgets) [92% coverage].
- A homemade HTTP client (using DIO) that provides directly constructed objects/lists, without the need for processing (just indicate the fromJson of a specific class to target in the client).
 
## Install and creation

Let's take a look at the detailed steps for the proper use of Full Layout.

### Step 1. Install the tool


```bash
$dart pub install full_layout
```

---

### Step 2. Create Flutter project with the tool.

```bash
$full_layout create my_app --package com.mycompany.my_app --name "My App"
```

- xxxx
- xxxx

---

## Details about the your recien creado proyecto


### Detail 1. Clean Architecture.

The first thing will be to create a class that you consider as `provider`, however, it does not have to have any extension with `ChangeNotifier`.

Once created, we can declare variables of type `DeepObservable`, these will contain the necessary properties for the reactivity.

We must indicate the type of data to handle, and the value it will have initially.

```dart
class HomeController{
  HomeController();

  DeepObservable<int> observableInt = DeepObservable(0);

  DeepObservable<bool?> observableBool = DeepObservable(null);

  DeepObservable<List<String>> observableList = DeepObservable(<String>[]);
}
```
---

### Detail 2. State Gesture - BLoC with Cubit.

To use your `provider` classes with `DeepObservable` variables properly, dependency injection must be performed first. This can be done in two different ways.

#### Example

To perform a global dependency injection, ideally wrap `MaterialApp` with `GlobalInjector`, indicating in *registrations* the `provider` classes to be used. They will be available from any point of the application.

---

### Detail 3. DIO and homemade HTTP Client.

To use your `provider` classes with `DeepObservable` variables properly, dependency injection must be performed first. This can be done in two different ways.

### Detail 4. Internationalitation with l10n.

To use your `provider` classes with `DeepObservable` variables properly, dependency injection must be performed first. This can be done in two different ways.

### Detail 5. Route Helper with GET.

To use your `provider` classes with `DeepObservable` variables properly, dependency injection must be performed first. This can be done in two different ways.

### Detail 6. Responsive Design.

To use your `provider` classes with `DeepObservable` variables properly, dependency injection must be performed first. This can be done in two different ways.

### Detail 6. Test types (92% coverage).

To use your `provider` classes with `DeepObservable` variables properly, dependency injection must be performed first. This can be done in two different ways.