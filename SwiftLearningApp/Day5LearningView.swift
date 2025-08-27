import SwiftUI

struct Day5LearningView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSection = 0
    
    let sections = [
        "类基础",
        "结构体基础", 
        "属性类型",
        "方法定义",
        "实践练习",
        "总结回顾"
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
                            ClassBasicsSection()
                        case 1:
                            StructBasicsSection()
                        case 2:
                            PropertiesSection()
                        case 3:
                            MethodsSection()
                        case 4:
                           Day5PracticeSection()
                        case 5:
                            SummarySection()
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
            .navigationTitle("Day 5: 类与结构体")
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

// MARK: - 类基础章节
struct ClassBasicsSection: View {
    var body: some View {
        VStack(spacing: 16) {
            ConceptCard(
                title: "类 (Class) 基础",
                content: "类是面向对象编程的核心概念，它是创建对象的模板。类可以包含属性（数据）和方法（功能）。"
            )
            
            CodeExampleCard(
                title: "类定义示例",
                code: """
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func introduce() -> String {
        return "我是 \\(name)，今年 \\(age) 岁"
    }
}

// 创建类实例
let person = Person(name: "小明", age: 25)
print(person.introduce()) // 我是 小明，今年 25 岁
"""
            )
            
            PersonCard()
            
            TipCard(
                title: "类的特点",
                tips: [
                    "类是引用类型，赋值时传递的是引用",
                    "支持继承，可以创建子类",
                    "需要显式定义构造器 init()",
                    "可以包含属性和方法"
                ]
            )
        }
        .padding(.horizontal)
    }
}

// MARK: - 结构体基础章节
struct StructBasicsSection: View {
    var body: some View {
        VStack(spacing: 16) {
            ConceptCard(
                title: "结构体 (Struct) 基础",
                content: "结构体是Swift中另一种重要的数据类型，它是值类型。结构体适合用来封装简单的数据值。"
            )
            
            CodeExampleCard(
                title: "结构体定义示例",
                code: """
struct Rectangle {
    var width: Double
    var height: Double
    
    func area() -> Double {
        return width * height
    }
    
    func perimeter() -> Double {
        return 2 * (width + height)
    }
}

// 创建结构体实例
var rect = Rectangle(width: 10, height: 5)
print("面积: \\(rect.area())")      // 面积: 50.0
print("周长: \\(rect.perimeter())") // 周长: 30.0
"""
            )
            
            RectangleCard()
            
            TipCard(
                title: "结构体 vs 类",
                tips: [
                    "结构体是值类型，类是引用类型",
                    "结构体自动获得成员构造器",
                    "结构体不支持继承",
                    "结构体适合简单数据封装"
                ]
            )
        }
        .padding(.horizontal)
    }
}

// MARK: - 属性章节
struct PropertiesSection: View {
    var body: some View {
        VStack(spacing: 16) {
            ConceptCard(
                title: "属性类型",
                content: "Swift提供了多种属性类型：存储属性用于存储值，计算属性动态计算值，属性观察器监听属性变化。"
            )
            
            CodeExampleCard(
                title: "属性示例",
                code: """
class BankAccount {
    // 存储属性
    var balance: Double = 0 {
        // 属性观察器
        willSet {
            print("余额即将变为 \\(newValue)")
        }
        didSet {
            print("余额已更新：\\(oldValue) → \\(balance)")
        }
    }
    
    // 计算属性
    var formattedBalance: String {
        return String(format: "¥%.2f", balance)
    }
    
    func deposit(_ amount: Double) {
        balance += amount
    }
}
"""
            )
            
            BankAccountCard()
            
            TipCard(
                title: "属性要点",
                tips: [
                    "存储属性：直接存储值",
                    "计算属性：通过计算获得值",
                    "willSet：在设置新值前调用",
                    "didSet：在设置新值后调用"
                ]
            )
        }
        .padding(.horizontal)
    }
}

// MARK: - 方法章节
struct MethodsSection: View {
    var body: some View {
        VStack(spacing: 16) {
            ConceptCard(
                title: "方法定义",
                content: "方法是与特定类型相关的函数。实例方法在类型实例上调用，类型方法在类型本身上调用。"
            )
            
            CodeExampleCard(
                title: "方法示例",
                code: """
struct Counter {
    var count = 0
    
    // 实例方法
    mutating func increment() {
        count += 1
    }
    
    mutating func increment(by amount: Int) {
        count += amount
    }
    
    // 类型方法
    static func description() -> String {
        return "这是一个计数器"
    }
}

var counter = Counter()
counter.increment()          // count = 1
counter.increment(by: 5)     // count = 6
print(Counter.description()) // 这是一个计数器
"""
            )
            
            CounterCard()
            
            TipCard(
                title: "方法要点",
                tips: [
                    "结构体中修改属性的方法需要 mutating",
                    "static 定义类型方法",
                    "类中可用 class 替代 static（支持重写）",
                    "方法可以有参数标签和默认值"
                ]
            )
        }
        .padding(.horizontal)
    }
}

// MARK: - 实践章节
struct Day5PracticeSection: View {
    var body: some View {
        VStack(spacing: 16) {
            ConceptCard(
                title: "综合实践",
                content: "通过实际案例来应用类和结构体的知识，加深对面向对象编程概念的理解。"
            )
            
            StudentCard()
            ProductCard()
            
            TipCard(
                title: "设计建议",
                tips: [
                    "简单数据用结构体，复杂对象用类",
                    "需要继承时选择类",
                    "性能要求高时优先考虑结构体",
                    "合理使用计算属性简化代码"
                ]
            )
        }
        .padding(.horizontal)
    }
}

// MARK: - 总结章节
struct SummarySection: View {
    var body: some View {
        VStack(spacing: 16) {
            ConceptCard(
                title: "Day 5 总结",
                content: "今天我们学习了Swift中类和结构体的基础知识，这是面向对象编程的重要基础。"
            )
            
            TipCard(
                title: "核心要点回顾",
                tips: [
                    "类是引用类型，支持继承",
                    "结构体是值类型，性能更好",
                    "属性包括存储属性和计算属性",
                    "方法分为实例方法和类型方法",
                    "合理选择类或结构体很重要"
                ]
            )
            
            ConceptCard(
                title: "下节预告",
                content: "Day 6 我们将学习更高级的面向对象特性：继承、多态和重写。"
            )
        }
        .padding(.horizontal)
    }
}

// MARK: - 预览
#Preview {
    Day5LearningView()
}
