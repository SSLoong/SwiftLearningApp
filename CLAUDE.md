# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

SwiftLearningApp 是一个 Swift 语言学习应用，使用 SwiftUI 构建，旨在帮助用户通过交互式课程学习 Swift 编程基础。

## 开发环境和命令

### 构建和运行
```bash
# 在 Xcode 中打开项目
open SwiftLearningApp.xcodeproj

# 或者使用 xcodebuild 命令行工具进行构建
xcodebuild -project SwiftLearningApp.xcodeproj -scheme SwiftLearningApp -destination 'platform=iOS Simulator,name=iPhone 15' build

# 运行测试
xcodebuild test -project SwiftLearningApp.xcodeproj -scheme SwiftLearningApp -destination 'platform=iOS Simulator,name=iPhone 15'
```

### 测试
- 单元测试文件：`SwiftLearningAppTests/SwiftLearningAppTests.swift`
- UI测试文件：`SwiftLearningAppUITests/SwiftLearningAppUITests.swift`

## 代码架构

### 核心文件结构
- `SwiftLearningApp.swift` - 应用主入口点，定义了应用的根视图
- `ContentView.swift` - 应用主界面，包含学习进度展示和Day选择
- `Day1LearningView.swift` - Day 1 学习内容视图，包含分段学习内容
- `InteractiveComponents.swift` - 可重用的交互式学习组件

### 架构特点
1. **基于 SwiftUI** - 使用声明式UI框架构建所有界面
2. **模块化组件** - 将交互式学习组件分离到独立文件
3. **状态管理** - 使用 `@State` 和 `@Binding` 管理界面状态
4. **分段式学习** - 每个Day包含多个学习章节，便于扩展

### 主要组件类型

#### 学习界面组件
- `DayLearningCard` - 展示每日学习卡片
- `ConceptCard` - 概念介绍卡片
- `CodeExampleCard` - 代码示例展示卡片  
- `TipCard` - 学习提示卡片

#### 交互式练习组件
- `InteractiveConverterCard` - 类型转换练习
- `InteractiveStringCard` - 字符串插值练习
- `BMICalculatorCard` - BMI计算器
- `PersonalInfoCard` - 个人信息生成器
- `TemperatureConverterCard` - 温度转换器

### 课程内容结构
Day 1 包含以下学习章节：
1. 变量和常量 (`VariablesAndConstantsSection`)
2. 基本数据类型 (`BasicTypesSection`)
3. 类型转换 (`TypeConversionSection`)
4. 字符串插值 (`StringInterpolationSection`)
5. 实践练习 (`PracticeSection`)

## 开发规范

### SwiftUI 最佳实践
- 优先使用 `let` 声明常量
- 使用 `@State` 管理本地状态，`@Binding` 用于父子组件通信
- 组件拆分：将复杂视图拆分为更小的可重用组件
- 使用 `.background()` 和 `.cornerRadius()` 创建卡片样式

### 代码风格
- 中文注释和字符串
- 使用 `MARK:` 注释分隔代码段
- 组件名称采用描述性命名
- 预览代码：每个主要组件都应包含 `PreviewProvider`

### 扩展指南
添加新的学习日时：
1. 在 `ContentView.swift` 中添加新的 Day 卡片
2. 创建对应的学习视图文件（如 `Day2LearningView.swift`）
3. 在 `InteractiveComponents.swift` 中添加新的练习组件
4. 更新导航逻辑以支持新的学习内容