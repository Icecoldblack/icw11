# The Haunted Creature Registry (MAD In-Class Activity 11)

**Track:** Undergraduate (shared build only, no Task B or C)

**Team:** Uyiosa Nehikhuere and PARTNER NAME HERE

## How to run

```
flutter pub get
flutter run
flutter build apk --release
```

## File layout

```
lib/
  main.dart                  app entry, theme, home screen
  screens/
    welcome_screen.dart      the foyer (typewriter title, gradient)
    signup_screen.dart       the lab (form, validation, loading button)
    success_screen.dart      the ballroom (confetti, creature emoji)
test/
  widget_test.dart           checks the welcome button renders
```

## Navigation

- Welcome to Signup uses `Navigator.push`, so Back returns to the foyer.
- Signup to Success uses `Navigator.pushReplacement`, so Back cannot return to the form and resubmit.
- "Back to the Foyer" calls `Navigator.pop`, which lands on the Welcome screen because the form was replaced.

## Understanding

**Navigation stack.** Flutter keeps screens in a stack. `push` adds the lab on top of the foyer. `pushReplacement` swaps the lab for the ballroom, so the stack is foyer then ballroom. Popping from the ballroom goes straight to the foyer.

**State lifetime.** The text controllers live in the `SignupScreen` State. When that screen leaves the stack, its State is destroyed and the typed values are gone. That is why the name and creature type are passed forward through the `SuccessScreen` constructor instead of being read later.

**Dispose.** The `TextEditingController`s are released in `SignupScreen.dispose()` and the `ConfettiController` is released in `SuccessScreen.dispose()`, so nothing leaks. After each `await` (date picker and the 2 second delay) the code checks `if (!mounted) return;` so it never uses `context` or `setState` after the screen is gone.

## Creativity

- The success screen shows a creature specific emoji (Ghost 👻, Bat 🦇, Black Cat 🐈‍⬛, Pumpkin Spirit 🎃, Witch 🧙).
- The welcome title types itself out with a typewriter animation over a dark purple to black gradient.

## Ghost Hunt test table (Pixel 9 emulator)

| # | Test case | Result |
|---|-----------|--------|
| 1 | Submit with all fields empty shows every error | To verify |
| 2 | Register each of the five creatures and see the right name and emoji | To verify |
| 3 | Email without @ and a short password show their errors | To verify |
| 4 | Eye icon toggles password visibility | To verify |
| 5 | Date picker blocks future dates and an empty date blocks submit | To verify |
| 6 | Back from the lab clears the entered values | To verify |
| 7 | Back from the ballroom does not resubmit | To verify |
| 8 | Double tap during loading navigates only once | To verify |
| 9 | Confetti fires once and returning to the foyer does not crash | To verify |

## Bug notes

None found yet.
