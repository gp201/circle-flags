# PNG Flags Generation

This directory contains PNG versions of the SVG flags, automatically generated using Inkscape.

## Automated Conversion

The PNG files are automatically generated from the SVG files using a GitHub Action workflow. The conversion process:

1. **Triggers**: Runs automatically when SVG files in the `flags/` directory are updated
2. **Tool**: Uses Inkscape for high-quality conversion
3. **Output**: 512x512 pixel PNG files with transparent backgrounds
4. **Process**: Creates a Pull Request with the updated PNG files

## Manual Conversion

You can also run the conversion manually using the provided script:

```bash
# Make sure Inkscape is installed
brew install inkscape  # macOS
# or
sudo apt-get install inkscape  # Ubuntu/Debian

# Run the conversion script
cd flags_png
chmod +x convert.sh
./convert.sh
```

## Script Features

- **Simple and Direct**: Straightforward conversion without complex error handling
- **Transparent Background**: All PNG files maintain transparent backgrounds
- **Consistent Size**: All outputs are 512x512 pixels
- **Subdirectory Support**: Processes files in subdirectories (e.g., `flags/language/`, `flags/other/`)
- **Cross-platform**: Works on macOS, Linux, and Windows (with Inkscape installed)

## GitHub Workflow

The automated workflow (`.github/workflows/convert-flags.yml`) includes:

- **Quality Checks**: Verifies Inkscape installation and conversion results
- **Change Detection**: Only creates PRs when PNG files actually change
- **Detailed Reporting**: Provides summary of conversion results
- **Auto-PR Creation**: Creates descriptive pull requests for review

## File Structure

```
flags_png/
├── convert.sh          # Conversion script
├── README.md          # This file
├── [country].png      # Country flag PNGs
├── language/          # Language flag PNGs
│   └── [language].png
└── other/             # Other flag PNGs
    └── [other].png
```

## Contributing

When adding new SVG flags to the `flags/` directory:

1. The GitHub Action will automatically detect the changes
2. PNG versions will be generated and a PR will be created
3. Review and merge the PR to update the PNG files

No manual intervention is required for PNG generation!
