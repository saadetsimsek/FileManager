# FileManager

*The full set of file system operations an application actually needs.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-18.0%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Topic](https://img.shields.io/badge/topic-file%20system-6366F1?style=flat-square) ![Dependencies](https://img.shields.io/badge/dependencies-none-16A34A?style=flat-square)

## Overview

Locating the documents directory, creating folders including nested ones, writing a file, reading it back, checking existence and deleting. Each operation is kept as a separate readable step rather than hidden behind a helper.

## How it works

```mermaid
flowchart TD
    A["FileManager.default"] --> B["urls(for: .documentDirectory, in: .userDomainMask)"]
    B --> C["appendingPathComponent for a folder"]
    C --> D["createDirectory(at:withIntermediateDirectories:)"]
    D --> E["appendingPathComponent for a file"]
    E --> F["createFile(atPath:contents:)<br/>String to Data with utf8"]
    F --> G["fileExists(atPath:)"]
    G --> H["contents(atPath:) to read back"]
    G --> I["removeItem(at:)"]
```

## Implementation notes

- **Documents, not the bundle.** The app bundle is read only, so anything written at runtime belongs in the documents directory, which is what the first call resolves.
- **Intermediate directories.** Passing `withIntermediateDirectories: true` creates a whole path in one call, which is the difference between working and failing on a nested folder.
- **Existence checked before deletion.** `removeItem` throws on a missing path, so the check is not optional in practice.
- **Strings converted explicitly.** Text is encoded to `Data` with UTF-8 before writing, making the encoding a decision rather than a default.

## Project structure

```
FileManager/
└── ViewController.swift
```

## Requirements

Xcode 15 or later, iOS 18.0 or later. No external dependencies.
