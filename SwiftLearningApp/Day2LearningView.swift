// Day2LearningView.swift
// Day 2 Swift 函数、闭包和集合类型学习界面

import SwiftUI

struct Day2LearningView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSection = 0
    
    let sections = [
        "函数基础",
        "函数参数和返回值",
        "闭包语法",
        "集合类型：Array",
        "集合类型：Dictionary和Set",
        "实践练习"
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 顶部进度条
                ProgressView(value: Double(currentSection + 1), total: Double(sections.count))
                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                    .scaleEffect(x: 1, y: 2)
                
                // 当前章节标题
                Text(sections[currentSection])
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.green)
                
                // 学习内容
                ScrollView {
                    VStack(spacing: 20) {
                        switch currentSection {
                        case 0:
                            FunctionBasicsSection()
                        case 1:
                            FunctionParametersSection()
                        case 2:
                            ClosureSyntaxSection()
                        case 3:
                            ArraySection()
                        case 4:
                            DictionarySetSection()
                        case 5:
                            Day2PracticeSection()
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
            .navigationTitle("Day 2: 函数与集合")
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

// MARK: - 函数基础章节
struct FunctionBasicsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🔧 函数基础",
                content: """
                函数是可重用的代码块，用于完成特定任务：
                
                • func 关键字定义函数
                • 函数名描述功能
                • 大括号包含执行代码
                • 可以接受参数和返回值
                
                函数让代码更模块化、易维护！
                """
            )
            
            CodeExampleCard(
                title: "简单函数示例",
                code: """
                // 无参数无返回值的函数
                func sayHello() {
                    print("Hello, Swift!")
                }
                
                // 调用函数
                sayHello()
                
                // 有参数的函数
                func greet(name: String) {
                    print("Hello, \\(name)!")
                }
                
                greet(name: "小明")
                """
            )
            
            TipCard(
                title: "💡 函数命名规范",
                content: """
                • 使用动词开头，描述功能：calculate、update、create
                • 使用驼峰命名法：calculateArea、getUserInfo
                • 函数名应该清晰表达其作用
                """
            )
        }
    }
}

// MARK: - 函数参数和返回值章节
struct FunctionParametersSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "📝 参数和返回值",
                content: """
                函数的强大之处在于参数和返回值：
                
                • 参数：函数的输入数据
                • 返回值：函数的输出结果
                • -> 符号指定返回类型
                • return 语句返回结果
                """
            )
            
            CodeExampleCard(
                title: "参数和返回值示例",
                code: """
                // 带返回值的函数
                func add(a: Int, b: Int) -> Int {
                    return a + b
                }
                
                let result = add(a: 5, b: 3)  // result = 8
                
                // 多个参数，不同类型
                func createMessage(name: String, age: Int) -> String {
                    return "我是\\(name)，今年\\(age)岁"
                }
                
                let message = createMessage(name: "小红", age: 20)
                
                // 默认参数值
                func greet(name: String, greeting: String = "你好") -> String {
                    return "\\(greeting), \\(name)!"
                }
                
                greet(name: "小李")  // 使用默认greeting
                greet(name: "小王", greeting: "早上好")
                """
            )
            
            TipCard(
                title: "🎯 参数标签",
                content: """
                Swift支持参数标签让函数调用更清晰：
                • 外部标签：调用时使用的名称
                • 内部标签：函数内部使用的名称
                • 使用下划线_隐藏外部标签
                """
            )
        }
    }
}

// MARK: - 闭包语法章节
struct ClosureSyntaxSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🎁 闭包 (Closures)",
                content: """
                闭包是自包含的函数代码块：
                
                • 可以作为参数传递
                • 可以存储在变量中
                • 可以捕获上下文中的值
                • 语法简洁，功能强大
                
                闭包在数组操作中特别有用！
                """
            )
            
            CodeExampleCard(
                title: "闭包语法演进",
                code: """
                let numbers = [1, 2, 3, 4, 5]
                
                // 1. 完整闭包语法
                let doubled1 = numbers.map({ (number: Int) -> Int in
                    return number * 2
                })
                
                // 2. 类型推断
                let doubled2 = numbers.map({ number in
                    return number * 2
                })
                
                // 3. 简化写法
                let doubled3 = numbers.map({ number in number * 2 })
                
                // 4. 尾随闭包
                let doubled4 = numbers.map { number in number * 2 }
                
                // 5. 参数简写
                let doubled5 = numbers.map { $0 * 2 }
                
                print(doubled5)  // [2, 4, 6, 8, 10]
                """
            )
            
            InteractiveClosureCard()
        }
    }
}

// MARK: - 数组章节
struct ArraySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "📚 数组 (Array)",
                content: """
                数组是有序的元素集合：
                
                • 存储相同类型的多个值
                • 通过索引访问元素
                • 可变数组支持增删改操作
                • 提供丰富的操作方法
                """
            )
            
            CodeExampleCard(
                title: "数组基本操作",
                code: """
                // 创建数组
                var fruits = ["苹果", "香蕉", "橙子"]
                let numbers = [1, 2, 3, 4, 5]
                
                // 访问元素
                print(fruits[0])  // 苹果
                print(fruits.first)  // Optional("苹果")
                print(fruits.last)   // Optional("橙子")
                
                // 修改数组
                fruits.append("葡萄")
                fruits.insert("草莓", at: 0)
                fruits.remove(at: 1)
                
                // 数组属性
                print(fruits.count)     // 数组长度
                print(fruits.isEmpty)   // 是否为空
                
                // 遍历数组
                for fruit in fruits {
                    print(fruit)
                }
                """
            )
            
            ArrayOperationsCard()
        }
    }
}

// MARK: - Dictionary和Set章节
struct DictionarySetSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🗂️ 字典和集合",
                content: """
                字典(Dictionary)：键值对存储
                • [Key: Value] 语法
                • 快速查找值
                • 键必须唯一
                
                集合(Set)：唯一值的无序集合
                • 自动去重
                • 快速查找
                • 支持集合运算
                """
            )
            
            CodeExampleCard(
                title: "字典操作",
                code: """
                // 创建字典
                var scores = ["小明": 95, "小红": 87, "小李": 92]
                
                // 访问值
                print(scores["小明"])  // Optional(95)
                
                // 修改字典
                scores["小王"] = 88      // 添加新键值对
                scores["小红"] = 90      // 更新现有值
                scores.removeValue(forKey: "小李")  // 删除键值对
                
                // 遍历字典
                for (name, score) in scores {
                    print("\\(name): \\(score)分")
                }
                """
            )
            
            CodeExampleCard(
                title: "集合操作",
                code: """
                // 创建集合
                var colors: Set<String> = ["红色", "绿色", "蓝色"]
                
                // 集合操作
                colors.insert("黄色")
                colors.remove("绿色")
                
                // 检查元素
                print(colors.contains("红色"))  // true
                
                // 集合运算
                let set1: Set = [1, 2, 3, 4]
                let set2: Set = [3, 4, 5, 6]
                
                print(set1.union(set2))        // 并集
                print(set1.intersection(set2)) // 交集
                print(set1.subtracting(set2))  // 差集
                """
            )
            
            CollectionComparisonCard()
        }
    }
}

// MARK: - Day2实践练习章节
struct Day2PracticeSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🎯 Day 2 综合练习",
                content: "运用函数、闭包和集合类型解决实际问题！"
            )
            
            // 学生成绩管理器
            StudentGradeManagerCard()
            
            // 数组操作练习器
            ArrayOperationPracticeCard()
            
            // 购物清单管理器
            ShoppingListManagerCard()
            
            TipCard(
                title: "🏆 今日学习总结",
                content: """
                恭喜完成Day 2学习！今天掌握的知识点：
                
                • 函数定义、参数和返回值
                • 闭包语法和简化写法
                • 数组的创建和操作方法
                • 字典的键值对操作
                • 集合的唯一性和集合运算
                • 高阶函数：map、filter、reduce
                
                这些是Swift编程的核心技能！
                """
            )
        }
    }
}

// MARK: - 预览
struct Day2LearningView_Previews: PreviewProvider {
    static var previews: some View {
        Day2LearningView()
    }
}