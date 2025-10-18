import os

# -------------------------------
# Step 1: Input full test file path
# -------------------------------
test_path = input("Enter the full test file path (e.g., test/features/home/presentation/widgets/home_screen_test.dart): ").strip()
os.makedirs(os.path.dirname(test_path), exist_ok=True)

# -------------------------------
# Step 2: Derive some info from the file path
# -------------------------------
# Extract the Dart file name (without _test.dart)
file_name = os.path.basename(test_path).replace('_test.dart', '.dart')

# Try to infer widget class name from file name (e.g., home_screen.dart -> HomeScreen)
widget_name = ''.join(word.capitalize() for word in file_name.replace('.dart','').split('_'))

# Test description
test_name = input("Enter test description (e.g., renders correctly): ").strip()

# -------------------------------
# Step 3: Build widget test template with detailed comments
# -------------------------------
template = f"""\
// GENERATED WIDGET TEST
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app/{file_name}'; // 👈 Update 'your_app'

void main() {{
  group('{widget_name} Widget Tests', () {{

    testWidgets('{test_name}', (WidgetTester tester) async {{
      // ============================
      // Step 1: Build the widget tree
      // ============================
      // Use MaterialApp or WidgetsApp for proper rendering of Material widgets
      await tester.pumpWidget(
        const MaterialApp(
          home: {widget_name}(),
        ),
      );

      // ============================
      // Step 2: Verify initial state
      // ============================
      expect(find.byType({widget_name}), findsOneWidget);

      // ============================
      // Step 3: Perform interactions
      // ============================
      // e.g., simulate user tapping buttons, entering text, scrolling
      // await tester.tap(find.byType(ElevatedButton));
      // await tester.enterText(find.byType(TextField), 'Hello');

      // ============================
      // Step 4: Rebuild the widget tree
      // ============================
      // Call `pump` to apply the changes after interactions
      // await tester.pump();
      // await tester.pumpAndSettle(); ==> Useful when waiting for async UI updates.

      // ============================
      // Step 5: Verify new state
      // ============================
      // Check the widgets have updated as expected
      // expect(find.text('Count: 0'), findsNothing);
      // expect(find.text('Count: 1'), findsOneWidget);
    }});
  }});
}}
"""

# -------------------------------
# Step 4: Write the file
# -------------------------------
with open(test_path, "w", encoding="utf-8") as f:
    f.write(template)

print(f"✅ Super-commented widget test file generated: {test_path}")
