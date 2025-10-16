import os

# -------------------------------
# Step 1: Inputs
# -------------------------------
test_path = input("Enter the full path where the test file should be created (including filename): ").strip()
class_name = input("Enter the class name: ").strip()
use_mock = input("Do you want to add a Mockito mock? (y/n): ").lower() == 'y'

mock_class = ""
if use_mock:
    mock_class = input("Enter the mock class name (without 'Mock'): ").strip()

# Ensure folder exists
os.makedirs(os.path.dirname(test_path), exist_ok=True)

# -------------------------------
# Step 2: Setup lines and mocks
# -------------------------------
setup_line = f"sut = {class_name}();"  # default
mock_import_line = ""
mock_generate_line = ""
mock_declaration = ""
mock_init_line = ""

if use_mock:
    mock_import_line = "import 'package:mockito/annotations.dart';"
    mock_generate_line = f"@GenerateMocks([{mock_class}])"
    mock_declaration = f"late Mock{mock_class} mock{mock_class};"
    mock_init_line = f"mock{mock_class} = Mock{mock_class}();\n    sut = {class_name}(mock{mock_class});"

setup_line = mock_init_line if use_mock else setup_line

# -------------------------------
# Step 3: Create test template with AAA comments
# -------------------------------
template = f"""import 'package:flutter_test/flutter_test.dart';
{mock_import_line}

{mock_generate_line if use_mock else ''}

void main() {{
  late {class_name} sut;
  {mock_declaration if use_mock else ''}

  setUp(() {{
    {setup_line}
  }});

  group('{class_name} Tests', () {{
    test('should perform expected behavior', () {{
      // Arrange
      // e.g., when(mockDependency.someMethod()).thenReturn(...);

      // Act
      // final result = sut.method();

      // Assert
      // expect(result, ...);
      // verify(mockDependency.someMethod()).called(1);
    }});

    test('should handle error case', () {{
      // Arrange
      // Act
      // Assert
    }});
  }});
}}
"""

# -------------------------------
# Step 4: Write the file
# -------------------------------
with open(test_path, "w") as f:
    f.write(template)

print(f"✅ Professional test with AAA scaffold generated: {test_path}")
