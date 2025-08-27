// Day4LearningView.swift
// Day 4 Swift 可选类型与错误处理学习界面

import SwiftUI

struct Day4LearningView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSection = 0
    
    let sections = [
        "可选类型基础",
        "可选绑定",
        "强制解包与隐式解包",
        "错误处理基础",
        "Result类型",
        "实践练习"
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 顶部进度条
                ProgressView(value: Double(currentSection + 1), total: Double(sections.count))
                    .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                    .scaleEffect(x: 1, y: 2)
                
                // 当前章节标题
                Text(sections[currentSection])
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.orange)
                
                // 学习内容
                ScrollView {
                    VStack(spacing: 20) {
                        switch currentSection {
                        case 0:
                            OptionalBasicsSection()
                        case 1:
                            OptionalBindingSection()
                        case 2:
                            ForceUnwrappingSection()
                        case 3:
                            ErrorHandlingBasicsSection()
                        case 4:
                            ResultTypeSection()
                        case 5:
                            Day4PracticeSection()
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
            .navigationTitle("Day 4: 可选类型与错误处理")
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

// MARK: - 可选类型基础章节
struct OptionalBasicsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "❓ 可选类型基础",
                content: """
                可选类型(Optional)是Swift的核心特性：
                
                • 表示一个值可能存在，也可能为nil
                • 用?标记：String? 表示可选字符串
                • nil表示"没有值"的特殊值
                • 防止空指针异常，提升代码安全性
                • 强制明确处理可能为空的情况
                
                可选类型让你的代码更安全、更清晰！
                """
            )
            
            CodeExampleCard(
                title: "可选类型声明",
                code: """
                // 声明可选类型
                var name: String? = "小明"
                var age: Int? = nil
                var score: Double? = 95.5
                
                // 检查是否为nil
                if name != nil {
                    print("姓名存在: \\(name!)")
                } else {
                    print("姓名为空")
                }
                
                // 可选类型的默认值为nil
                var phoneNumber: String?  // 自动为nil
                print(phoneNumber)  // nil
                
                // 函数返回可选类型
                func findUser(id: Int) -> String? {
                    if id == 1 {
                        return "用户1"
                    }
                    return nil  // 找不到用户
                }
                """
            )
            
            TipCard(
                title: "💡 为什么需要可选类型？",
                content: """
                • 防止运行时崩溃：避免访问不存在的值
                • 明确意图：API清楚地表达可能返回空值
                • 编译时检查：编译器强制处理nil情况
                • 安全编程：养成防御式编程的好习惯
                """
            )
            
            // 交互式可选类型解析器
            OptionalExplorerCard()
        }
    }
}

// MARK: - 可选绑定章节
struct OptionalBindingSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🔗 可选绑定",
                content: """
                可选绑定是安全访问可选值的最佳方式：
                
                • if let - 临时绑定可选值
                • guard let - 提前退出模式
                • nil合并运算符(??) - 提供默认值
                • 可选链(?.) - 安全调用链式方法
                • 多重绑定 - 同时绑定多个可选值
                """
            )
            
            CodeExampleCard(
                title: "可选绑定语法",
                code: """
                let optionalName: String? = "Swift学习者"
                let optionalAge: Int? = 25
                
                // if let 绑定
                if let name = optionalName {
                    print("Hello, \\(name)!")  // 安全使用name
                } else {
                    print("姓名为空")
                }
                
                // guard let 绑定（提前退出）
                func processUser(_ name: String?, _ age: Int?) {
                    guard let userName = name,
                          let userAge = age else {
                        print("用户信息不完整")
                        return
                    }
                    
                    print("用户: \\(userName), 年龄: \\(userAge)")
                }
                
                // nil合并运算符
                let displayName = optionalName ?? "未知用户"
                let currentAge = optionalAge ?? 0
                """
            )
            
            CodeExampleCard(
                title: "可选链式调用",
                code: """
                class Person {
                    var address: Address?
                }
                
                class Address {
                    var street: String?
                    func getFullAddress() -> String? {
                        return street
                    }
                }
                
                let person = Person()
                person.address = Address()
                person.address?.street = "北京路123号"
                
                // 可选链式调用
                let street = person.address?.street
                let fullAddress = person.address?.getFullAddress()
                
                // 安全的链式调用
                if let address = person.address?.getFullAddress() {
                    print("完整地址: \\(address)")
                }
                """
            )
            
            TipCard(
                title: "🎯 可选绑定最佳实践",
                content: """
                • 优先使用if let进行临时绑定
                • 使用guard let实现提前退出逻辑
                • ??运算符提供合理的默认值
                • 可选链避免深层嵌套判断
                """
            )
            
            // 交互式可选绑定练习器
            OptionalBindingPracticeCard()
        }
    }
}

// MARK: - 强制解包与隐式解包章节
struct ForceUnwrappingSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "⚠️ 强制解包与隐式解包",
                content: """
                强制解包和隐式解包需要谨慎使用：
                
                • 强制解包(!) - 直接获取可选值，可能崩溃
                • 隐式解包(!) - 声明时就假定非nil
                • 安全使用场景 - 确定值一定存在时
                • 危险操作 - 可能导致运行时崩溃
                • 最佳实践 - 尽量避免使用
                """
            )
            
            CodeExampleCard(
                title: "强制解包示例",
                code: """
                let optionalNumber: Int? = 42
                
                // 强制解包 - 危险操作
                let number = optionalNumber!  // 如果为nil会崩溃
                print(number)  // 42
                
                // 安全的做法 - 先检查再解包
                if optionalNumber != nil {
                    let safeNumber = optionalNumber!
                    print("安全获取: \\(safeNumber)")
                }
                
                // 更安全的做法 - 使用可选绑定
                if let safeNumber = optionalNumber {
                    print("推荐方式: \\(safeNumber)")
                }
                
                // 错误示例 - 会导致崩溃
                let nilValue: String? = nil
                // let crash = nilValue!  // 运行时崩溃！
                """
            )
            
            CodeExampleCard(
                title: "隐式解包可选类型",
                code: """
                // 隐式解包可选类型
                var implicitString: String! = "Hello"
                
                // 可以直接使用，不需要解包
                print(implicitString)  // Hello
                print(implicitString.count)  // 5
                
                // 但仍然可以为nil
                implicitString = nil
                // print(implicitString)  // 崩溃！
                
                // 适用场景：UI组件初始化
                @IBOutlet weak var nameLabel: UILabel!
                
                // 在viewDidLoad后，确保不为nil
                override func viewDidLoad() {
                    super.viewDidLoad()
                    nameLabel.text = "用户名"  // 安全使用
                }
                """
            )
            
            TipCard(
                title: "🚨 安全使用指南",
                content: """
                ⚠️ 避免使用强制解包的情况：
                • 不确定值是否存在时
                • 处理外部数据时
                • 网络请求结果时
                
                ✅ 可以使用强制解包的情况：
                • 刚刚检查过不为nil
                • 程序逻辑保证不为nil
                • 隐式解包的UI组件
                """
            )
            
            // 交互式安全解包对比器
            SafeUnwrappingComparisonCard()
        }
    }
}

// MARK: - 错误处理基础章节
struct ErrorHandlingBasicsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🚨 错误处理基础",
                content: """
                Swift的错误处理让程序更健壮：
                
                • Error协议 - 定义错误类型
                • throws关键字 - 标记可能抛出错误的函数
                • try关键字 - 调用可能出错的函数
                • do-catch语句 - 捕获和处理错误
                • defer语句 - 清理资源
                """
            )
            
            CodeExampleCard(
                title: "定义和抛出错误",
                code: """
                // 定义错误类型
                enum ValidationError: Error {
                    case tooShort
                    case tooLong
                    case invalidCharacters
                    case empty
                }
                
                // 可能抛出错误的函数
                func validatePassword(_ password: String) throws -> Bool {
                    if password.isEmpty {
                        throw ValidationError.empty
                    }
                    
                    if password.count < 6 {
                        throw ValidationError.tooShort
                    }
                    
                    if password.count > 20 {
                        throw ValidationError.tooLong
                    }
                    
                    let validChars = CharacterSet.alphanumerics
                    if password.rangeOfCharacter(from: validChars.inverted) != nil {
                        throw ValidationError.invalidCharacters
                    }
                    
                    return true
                }
                """
            )
            
            CodeExampleCard(
                title: "捕获和处理错误",
                code: """
                // 使用do-catch处理错误
                func checkPassword(_ password: String) {
                    do {
                        let isValid = try validatePassword(password)
                        print("密码验证成功: \\(isValid)")
                    } catch ValidationError.empty {
                        print("错误: 密码不能为空")
                    } catch ValidationError.tooShort {
                        print("错误: 密码太短，至少6位")
                    } catch ValidationError.tooLong {
                        print("错误: 密码太长，最多20位")
                    } catch ValidationError.invalidCharacters {
                        print("错误: 密码包含无效字符")
                    } catch {
                        print("未知错误: \\(error)")
                    }
                }
                
                // 使用try?转换为可选值
                let result = try? validatePassword("abc123")
                
                // 使用try!强制执行（确定不会出错时）
                let forceResult = try! validatePassword("validpass123")
                """
            )
            
            TipCard(
                title: "🛡️ 错误处理最佳实践",
                content: """
                • 使用有意义的错误类型和消息
                • 在合适的层级处理错误
                • 使用defer进行资源清理
                • 避免忽略错误（除非确实应该忽略）
                • 为用户提供友好的错误提示
                """
            )
            
            // 交互式错误处理模拟器
            ErrorHandlingSimulatorCard()
        }
    }
}

// MARK: - Result类型章节
struct ResultTypeSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "📦 Result类型",
                content: """
                Result类型提供函数式错误处理方式：
                
                • Result<Success, Failure> - 泛型枚举
                • .success(value) - 成功情况
                • .failure(error) - 失败情况  
                • map和flatMap - 函数式变换
                • 适合异步操作的错误处理
                """
            )
            
            CodeExampleCard(
                title: "Result类型基础使用",
                code: """
                // 定义返回Result的函数
                func divide(_ a: Double, by b: Double) -> Result<Double, ArithmeticError> {
                    if b == 0 {
                        return .failure(.divisionByZero)
                    }
                    return .success(a / b)
                }
                
                enum ArithmeticError: Error {
                    case divisionByZero
                    case overflow
                }
                
                // 使用Result
                let result = divide(10, by: 2)
                
                switch result {
                case .success(let value):
                    print("计算结果: \\(value)")
                case .failure(let error):
                    print("计算错误: \\(error)")
                }
                
                // 使用map变换成功值
                let doubled = divide(10, by: 2).map { $0 * 2 }
                
                // 获取值或提供默认值
                let finalResult = divide(10, by: 0).get() ?? 0
                """
            )
            
            CodeExampleCard(
                title: "网络请求Result示例",
                code: """
                // 模拟网络请求
                func fetchUserData(id: Int, completion: @escaping (Result<User, NetworkError>) -> Void) {
                    // 模拟异步网络请求
                    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                        if id > 0 {
                            let user = User(id: id, name: "用户\\(id)")
                            completion(.success(user))
                        } else {
                            completion(.failure(.invalidID))
                        }
                    }
                }
                
                enum NetworkError: Error {
                    case noConnection
                    case invalidID
                    case serverError
                }
                
                struct User {
                    let id: Int
                    let name: String
                }
                
                // 使用网络请求
                fetchUserData(id: 1) { result in
                    switch result {
                    case .success(let user):
                        print("获取用户成功: \\(user.name)")
                    case .failure(let error):
                        print("获取用户失败: \\(error)")
                    }
                }
                """
            )
            
            TipCard(
                title: "🎯 Result vs throws",
                content: """
                • Result适合异步操作和回调
                • throws适合同步操作
                • Result可以存储和传递
                • throws需要立即处理
                • Result支持函数式编程风格
                """
            )
            
            // 交互式Result类型练习器
            ResultTypePracticeCard()
        }
    }
}

// MARK: - Day4实践练习章节
struct Day4PracticeSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ConceptCard(
                title: "🎯 Day 4 综合练习",
                content: "运用可选类型和错误处理构建安全的应用程序！"
            )
            
            // 用户注册表单验证器
            UserRegistrationFormCard()
            
            // 数据转换管道
            DataTransformationPipelineCard()
            
            // 文件操作模拟器
            FileOperationSimulatorCard()
            
            // API调用模拟器
            APICallSimulatorCard()
            
            TipCard(
                title: "🏆 今日学习总结",
                content: """
                恭喜完成Day 4学习！今天掌握的知识点：
                
                • 可选类型的概念和重要性
                • if let、guard let等安全绑定方式
                • 强制解包的危险性和适用场景
                • do-catch错误处理机制
                • Result类型的函数式错误处理
                • 防御式编程的最佳实践
                
                这些是构建安全Swift应用的核心技能！
                """
            )
        }
    }
}

// MARK: - 预览
struct Day4LearningView_Previews: PreviewProvider {
    static var previews: some View {
        Day4LearningView()
    }
}