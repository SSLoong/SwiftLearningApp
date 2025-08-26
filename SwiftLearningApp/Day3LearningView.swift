// Day3LearningView.swift
// Day 3 Swift 条件语句与循环学习界面

import SwiftUI

struct Day3LearningView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSection = 0
    
    let sections = [
        "if条件语句",
        "switch多分支语句",
        "for循环遍历",
        "while循环控制",
        "控制流语句",
        "实践练习"
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 顶部进度条
                ProgressView(value: Double(currentSection + 1), total: Double(sections.count))
                    .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                    .scaleEffect(x: 1, y: 2)
                
                // 当前章节标题
                Text(sections[currentSection])
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.purple)
                
                // 学习内容
                ScrollView {
                    VStack(spacing: 20) {
                        switch currentSection {
                        case 0:
                            IfStatementSection()
                        case 1:
                            SwitchStatementSection()
                        case 2:
                            ForLoopSection()
                        case 3:
                            WhileLoopSection()
                        case 4:
                            ControlFlowSection()
                        case 5:
                            Day3PracticeSection()
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
            .navigationTitle("Day 3: 条件语句与循环")
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

// MARK: - if条件语句章节
struct IfStatementSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🤔 if条件语句",
                content: """
                if语句让程序根据条件做决定：
                
                • if - 条件为true时执行
                • else if - 多个条件判断
                • else - 其他情况执行
                • 条件必须是Bool类型
                
                程序的逻辑分支从这里开始！
                """
            )
            
            CodeExampleCard(
                title: "基本if语句",
                code: """
                let temperature = 25
                
                // 基本if语句
                if temperature > 30 {
                    print("天气很热")
                }
                
                // if-else语句
                if temperature > 30 {
                    print("天气很热")
                } else {
                    print("天气还好")
                }
                
                // 多重条件
                if temperature > 35 {
                    print("天气非常热")
                } else if temperature > 25 {
                    print("天气温暖")
                } else if temperature > 10 {
                    print("天气凉爽")
                } else {
                    print("天气寒冷")
                }
                """
            )
            
            TipCard(
                title: "💡 条件判断技巧",
                content: """
                • 使用比较运算符：==, !=, <, >, <=, >=
                • 使用逻辑运算符：&& (且), || (或), ! (非)
                • 可选绑定：if let value = optionalValue { ... }
                • 条件可以组合：if age >= 18 && hasLicense { ... }
                """
            )
            
            // 交互式温度判断器
            TemperatureJudgeCard()
        }
    }
}

// MARK: - switch多分支语句章节
struct SwitchStatementSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🎛️ switch语句",
                content: """
                switch语句处理多种可能的值：
                
                • 更清晰的多分支逻辑
                • 必须覆盖所有可能情况
                • 不需要break（Swift自动跳出）
                • 支持范围匹配和模式匹配
                • default处理其他情况
                """
            )
            
            CodeExampleCard(
                title: "switch基本语法",
                code: """
                let grade = "A"
                
                switch grade {
                case "A":
                    print("优秀！继续保持")
                case "B":
                    print("良好，再接再厉")
                case "C":
                    print("及格，需要努力")
                case "D", "F":
                    print("不及格，加油学习")
                default:
                    print("无效成绩")
                }
                
                // 数值范围匹配
                let score = 85
                switch score {
                case 90...100:
                    print("A等级")
                case 80..<90:
                    print("B等级")
                case 70..<80:
                    print("C等级")
                case 60..<70:
                    print("D等级")
                default:
                    print("F等级")
                }
                """
            )
            
            CodeExampleCard(
                title: "高级switch用法",
                code: """
                // 元组匹配
                let point = (2, 3)
                switch point {
                case (0, 0):
                    print("原点")
                case (_, 0):
                    print("在x轴上")
                case (0, _):
                    print("在y轴上")
                case (-2...2, -2...2):
                    print("在小正方形内")
                default:
                    print("在其他位置")
                }
                
                // where条件
                let number = 25
                switch number {
                case let x where x % 2 == 0:
                    print("\\(x) 是偶数")
                case let x where x % 2 == 1:
                    print("\\(x) 是奇数")
                default:
                    break
                }
                """
            )
            
            // 交互式成绩评定器
            GradeEvaluatorCard()
        }
    }
}

// MARK: - for循环章节
struct ForLoopSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🔄 for循环",
                content: """
                for循环用于重复执行代码：
                
                • for-in 遍历序列
                • 范围操作符：1...5, 1..<5
                • 遍历数组、字典、字符串
                • stride 函数控制步长
                • 可以使用where条件过滤
                """
            )
            
            CodeExampleCard(
                title: "基本for循环",
                code: """
                // 范围循环
                for i in 1...5 {
                    print("第\\(i)次循环")
                }
                
                // 遍历数组
                let fruits = ["苹果", "香蕉", "橙子"]
                for fruit in fruits {
                    print("我喜欢\\(fruit)")
                }
                
                // 带索引遍历
                for (index, fruit) in fruits.enumerated() {
                    print("\\(index + 1). \\(fruit)")
                }
                
                // 遍历字典
                let scores = ["小明": 95, "小红": 87, "小李": 92]
                for (name, score) in scores {
                    print("\\(name)的分数是\\(score)")
                }
                
                // 忽略循环变量
                for _ in 1...3 {
                    print("重复执行")
                }
                """
            )
            
            CodeExampleCard(
                title: "高级for循环",
                code: """
                // stride步长控制
                for i in stride(from: 0, to: 10, by: 2) {
                    print(i)  // 0, 2, 4, 6, 8
                }
                
                // 倒序遍历
                for i in (1...5).reversed() {
                    print(i)  // 5, 4, 3, 2, 1
                }
                
                // 条件过滤
                for i in 1...10 where i % 2 == 0 {
                    print("偶数: \\(i)")
                }
                
                // 嵌套循环
                for i in 1...3 {
                    for j in 1...3 {
                        print("(\\(i), \\(j))")
                    }
                }
                """
            )
            
            // 交互式数列生成器
            NumberSequenceCard()
        }
    }
}

// MARK: - while循环章节
struct WhileLoopSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "⏰ while循环",
                content: """
                while循环在条件为true时重复执行：
                
                • while - 先检查条件，再执行
                • repeat-while - 先执行一次，再检查条件
                • 适合不知道确切循环次数的情况
                • 注意避免无限循环
                """
            )
            
            CodeExampleCard(
                title: "while循环示例",
                code: """
                // 基本while循环
                var count = 1
                while count <= 5 {
                    print("计数: \\(count)")
                    count += 1
                }
                
                // 猜数字游戏
                var secretNumber = 7
                var guess = 0
                var attempts = 0
                
                while guess != secretNumber {
                    guess = Int.random(in: 1...10)
                    attempts += 1
                    print("第\\(attempts)次猜测: \\(guess)")
                }
                print("猜中了！用了\\(attempts)次")
                
                // repeat-while循环
                var number = 5
                repeat {
                    print("数字: \\(number)")
                    number -= 1
                } while number > 0
                """
            )
            
            TipCard(
                title: "⚠️ while循环注意事项",
                content: """
                • 确保循环条件最终会变成false
                • 在循环体内修改循环条件相关的变量
                • 考虑使用for-in循环的替代方案
                • repeat-while至少执行一次，适合输入验证
                """
            )
            
            // 交互式倒计时器
            CountdownTimerCard()
        }
    }
}

// MARK: - 控制流语句章节
struct ControlFlowSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🎮 控制流语句",
                content: """
                控制流语句改变程序执行顺序：
                
                • break - 跳出循环或switch
                • continue - 跳过当前循环迭代
                • return - 从函数返回
                • guard - 提前退出检查
                • fallthrough - switch继续下一个case
                """
            )
            
            CodeExampleCard(
                title: "break和continue",
                code: """
                // continue跳过当前循环
                for i in 1...10 {
                    if i % 2 == 0 {
                        continue  // 跳过偶数
                    }
                    print("奇数: \\(i)")
                }
                
                // break跳出循环
                for i in 1...10 {
                    if i == 5 {
                        break  // 遇到5就停止
                    }
                    print(i)
                }
                
                // 标记循环
                outerLoop: for i in 1...3 {
                    innerLoop: for j in 1...3 {
                        if i == 2 && j == 2 {
                            break outerLoop  // 跳出外层循环
                        }
                        print("(\\(i), \\(j))")
                    }
                }
                """
            )
            
            CodeExampleCard(
                title: "guard语句",
                code: """
                func processAge(_ age: Int?) {
                    // guard提前检查，不满足条件就返回
                    guard let validAge = age, validAge >= 0 else {
                        print("年龄无效")
                        return
                    }
                    
                    // validAge在这里可以安全使用
                    if validAge >= 18 {
                        print("成年人，年龄：\\(validAge)")
                    } else {
                        print("未成年人，年龄：\\(validAge)")
                    }
                }
                
                processAge(25)    // 成年人，年龄：25
                processAge(-5)    // 年龄无效
                processAge(nil)   // 年龄无效
                """
            )
            
            TipCard(
                title: "🎯 控制流最佳实践",
                content: """
                • guard用于提前检查和退出，让主逻辑更清晰
                • continue和break让循环更高效
                • 避免深层嵌套，使用guard简化代码
                • 合理使用标记(label)控制嵌套循环
                """
            )
        }
    }
}

// MARK: - Day3实践练习章节
struct Day3PracticeSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🎯 Day 3 综合练习",
                content: "运用条件语句和循环解决实际问题！"
            )
            
            // 数字猜测游戏
            NumberGuessGameCard()
            
            // 成绩统计分析器
            GradeStatisticsCard()
            
            // 密码验证器
            PasswordValidatorCard()
            
            // FizzBuzz游戏
            FizzBuzzGameCard()
            
            TipCard(
                title: "🏆 今日学习总结",
                content: """
                恭喜完成Day 3学习！今天掌握的知识点：
                
                • if条件语句的各种用法
                • switch多分支语句和模式匹配
                • for循环和范围操作符
                • while和repeat-while循环
                • 控制流语句：break、continue、guard
                • 循环嵌套和标记使用
                
                这些控制结构是编程逻辑的基础！
                """
            )
        }
    }
}

// MARK: - 预览
struct Day3LearningView_Previews: PreviewProvider {
    static var previews: some View {
        Day3LearningView()
    }
}