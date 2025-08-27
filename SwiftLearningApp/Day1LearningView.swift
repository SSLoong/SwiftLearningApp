// Day1LearningView.swift
// Day 1 Swift 基础语法学习界面

import SwiftUI

struct Day1LearningView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSection = 0
    
    let sections = [
        "变量和常量",
        "基本数据类型", 
        "类型转换",
        "字符串插值",
        "实践练习"
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 顶部进度条
                ProgressView(value: Double(currentSection + 1), total: Double(sections.count))
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    .scaleEffect(x: 1, y: 2)
                
                // 当前章节标题
                Text(sections[currentSection])
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.blue)
                
                // 学习内容
                ScrollView {
                    VStack(spacing: 20) {
                        switch currentSection {
                        case 0:
                            VariablesAndConstantsSection()
                        case 1:
                            BasicTypesSection()
                        case 2:
                            TypeConversionSection()
                        case 3:
                            StringInterpolationSection()
                        case 4:
                            PracticeSection()
                        default:
                            Text("内容加载中...")
                        }
                    }
                    .padding()
                }
                
                // 底部导航按钮
                HStack {
                    Button("上一节") {
                        if currentSection > 0 {
                            withAnimation(.easeInOut) {
                                currentSection -= 1
                            }
                        }
                    }
                    .disabled(currentSection == 0)
                    
                    Spacer()
                    
                    Text("\(currentSection + 1) / \(sections.count)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Button(currentSection == sections.count - 1 ? "完成" : "下一节") {
                        if currentSection < sections.count - 1 {
                            withAnimation(.easeInOut) {
                                currentSection += 1
                            }
                        } else {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
            }
            .navigationTitle("Day 1: Swift 基础")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("关闭") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - 变量和常量章节
struct VariablesAndConstantsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // 概念介绍
            ConceptCard(
                title: "🔢 变量 vs 常量",
                content: """
                Swift 中有两种存储值的方式：
                
                • let - 声明常量（不可变）
                • var - 声明变量（可变）
                
                优先使用 let，这是Swift的最佳实践！
                """
            )
            
            // 代码示例
            CodeExampleCard(
                title: "代码示例",
                code: """
                // 常量 - 值不能修改
                let appName = "Swift学习应用"
                let version = 1.0
                
                // 变量 - 值可以修改
                var currentLesson = 1
                var isLearning = true
                
                // 修改变量
                currentLesson = 2
                isLearning = false
                """
            )
            
            // 重要提示
            TipCard(
                title: "💡 重要提示",
                content: "常量一旦赋值就不能修改，这让代码更安全、性能更好。只有确实需要修改值时才使用 var。"
            )
        }
    }
}

// MARK: - 基本数据类型章节
struct BasicTypesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "📊 Swift 基本数据类型",
                content: """
                Swift 是类型安全的语言，主要数据类型：
                
                • Int - 整数
                • Double - 双精度浮点数（推荐）
                • Float - 单精度浮点数
                • String - 字符串
                • Bool - 布尔值（true/false）
                • Character - 单个字符
                """
            )
            
            CodeExampleCard(
                title: "类型示例",
                code: """
                let age: Int = 25
                let height: Double = 175.5
                let score: Float = 98.6
                let name: String = "Swift学习者"
                let isStudent: Bool = true
                let grade: Character = "A"
                
                // 类型推断 - Swift自动推断类型
                let autoInt = 42        // Int
                let autoDouble = 3.14   // Double
                let autoString = "Hello" // String
                """
            )
            
            TipCard(
                title: "🎯 学习要点",
                content: """
                • Swift 会自动推断变量类型
                • Double 比 Float 精度更高，优先使用 Double
                • 类型安全：不同类型不能直接混合运算
                """
            )
        }
    }
}

// MARK: - 类型转换章节  
struct TypeConversionSection: View {
    @State private var inputNumber = "42"
    @State private var convertedValue = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🔄 类型转换",
                content: """
                Swift 不支持隐式类型转换，必须显式转换：
                
                • Int(value) - 转换为整数
                • Double(value) - 转换为双精度
                • String(value) - 转换为字符串
                """
            )
            
            CodeExampleCard(
                title: "转换示例",
                code: """
                let intValue = 10
                let doubleValue = 3.14
                
                // 必须显式转换
                let sum = Double(intValue) + doubleValue
                
                // 字符串转数字（可能失败）
                let numberString = "123"
                if let number = Int(numberString) {
                    print("转换成功：\\(number)")
                }
                """
            )
            
            // 交互式转换器
            InteractiveConverterCard()
        }
    }
}

// MARK: - 字符串插值章节
struct StringInterpolationSection: View {
    @State private var userName = "Swift学习者"
    @State private var userAge = 20
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "💬 字符串插值",
                content: """
                使用 \\() 语法在字符串中插入变量：
                
                • 简洁易读
                • 支持表达式
                • 自动类型转换
                """
            )
            
            CodeExampleCard(
                title: "插值示例",
                code: """
                let name = "小明"
                let age = 20
                let score = 95.5
                
                let info = "我是\\(name)，今年\\(age)岁，分数\\(score)"
                let calculation = "2 + 3 = \\(2 + 3)"
                """
            )
            
            // 交互式字符串插值
            InteractiveStringCard(name: $userName, age: $userAge)
        }
    }
}

// MARK: - 实践练习章节
struct PracticeSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🎯 综合练习",
                content: "现在让我们把学到的知识应用到实际项目中！"
            )
            
            // BMI计算器
            BMICalculatorCard()
            
            // 个人信息卡片
            PersonalInfoCard()
            
            // 温度转换器
            TemperatureConverterCard()
            
            TipCard(
                title: "🏆 恭喜！",
                content: """
                你已经完成了 Swift 基础语法的学习！
                
                今天学到的内容：
                • 变量和常量的使用
                • Swift 基本数据类型
                • 类型转换技巧
                • 字符串插值语法
                • 实际项目练习
                """
            )
        }
    }
}

// MARK: - 基础组件现在在 SharedComponents.swift 中定义

// MARK: - 预览
struct Day1LearningView_Previews: PreviewProvider {
    static var previews: some View {
        Day1LearningView()
    }
}