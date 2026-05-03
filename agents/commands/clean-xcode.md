Clean all Xcode caches that could influence previews and builds:

1. Delete DerivedData: `rm -rf ~/Library/Developer/Xcode/DerivedData`
2. Delete Xcode caches: `rm -rf ~/Library/Caches/com.apple.dt.Xcode`
3. Delete preview user data: `rm -rf ~/Library/Developer/Xcode/UserData/Previews`
4. Delete SPM package caches: `rm -rf ~/Library/Caches/org.swift.swiftpm`
5. Delete SPM package metadata: `rm -rf ~/Library/org.swift.swiftpm`
6. Delete CoreSimulator caches: `rm -rf ~/Library/Developer/CoreSimulator/Caches`
7. Prune unavailable simulators: `xcrun simctl delete unavailable`

Run all of these commands. Report which caches were cleaned.