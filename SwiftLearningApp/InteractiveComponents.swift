// InteractiveComponents.swift
// Swift 学习应用的交互式练习组件

import SwiftUI

// MARK: - 交互式类型转换器
struct InteractiveConverterCard: View {
    @State private var inputText = "42"
    @State private var showResult = false
    
    var convertedInt: Int? {
        Int(inputText)
    }
    
    var convertedDouble: Double? {
        Double(inputText)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🧪 试试类型转换")
                .font(.headline)
                .foregroundColor(.purple)
            
            VStack(spacing: 12) {
                HStack {
                    Text("输入文本：")
                    TextField("输入数字", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: inputText) { _ in
                            showResult = true
                        }
                }
                
                if showResult && !inputText.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("转换为 Int：")
                            Spacer()
                            if let intValue = convertedInt {
                                Text("\(intValue)")
                                    .foregroundColor(.green)
                                    .fontWeight(.semibold)
                            } else {
                                Text("转换失败 ❌")
                                    .foregroundColor(.red)
                            }
                        }
                        
                        HStack {
                            Text("转换为 Double：")
                            Spacer()
                            if let doubleValue = convertedDouble {
                                Text("\(doubleValue)")
                                    .foregroundColor(.green)
                                    .fontWeight(.semibold)
                            } else {
                                Text("转换失败 ❌")
                                    .foregroundColor(.red)
                            }
                        }
                        
                        HStack {
                            Text("转换为 String：")
                            Spacer()
                            Text("\"\(inputText)\"")
                                .foregroundColor(.green)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.purple.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 交互式字符串插值
struct InteractiveStringCard: View {
    @Binding var name: String
    @Binding var age: Int
    
    var interpolatedString: String {
        "我的名字是 \(name)，今年 \(age) 岁"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🎮 体验字符串插值")
                .font(.headline)
                .foregroundColor(.indigo)
            
            VStack(spacing: 12) {
                HStack {
                    Text("姓名：")
                    TextField("输入姓名", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack {
                    Text("年龄：")
                    Stepper("\(age) 岁", value: $age, in: 1...100)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("字符串插值结果：")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(interpolatedString)
                        .font(.body)
                        .fontWeight(.medium)
                        .padding()
                        .background(Color.indigo.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.indigo.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - BMI 计算器
struct BMICalculatorCard: View {
    @State private var height: Double = 175
    @State private var weight: Double = 70
    
    var bmi: Double {
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
    
    var bmiCategory: (category: String, color: Color) {
        switch bmi {
        case ..<18.5:
            return ("偏瘦", .blue)
        case 18.5..<25.0:
            return ("正常", .green)
        case 25.0..<30.0:
            return ("偏胖", .orange)
        default:
            return ("肥胖", .red)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💪 BMI 健康计算器")
                .font(.headline)
                .foregroundColor(.green)
            
            VStack(spacing: 16) {
                // 身高滑块
                VStack(alignment: .leading) {
                    HStack {
                        Text("身高：\(Int(height)) cm")
                        Spacer()
                    }
                    Slider(value: $height, in: 140...220, step: 1)
                        .accentColor(.blue)
                }
                
                // 体重滑块
                VStack(alignment: .leading) {
                    HStack {
                        Text("体重：\(String(format: "%.1f", weight)) kg")
                        Spacer()
                    }
                    Slider(value: $weight, in: 40...150, step: 0.5)
                        .accentColor(.blue)
                }
                
                Divider()
                
                // BMI 结果
                VStack(spacing: 8) {
                    HStack {
                        Text("BMI 指数：")
                        Spacer()
                        Text(String(format: "%.1f", bmi))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(bmiCategory.color)
                    }
                    
                    HStack {
                        Text("健康状况：")
                        Spacer()
                        Text(bmiCategory.category)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(bmiCategory.color)
                    }
                }
                .padding()
                .background(bmiCategory.color.opacity(0.1))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 个人信息卡片
struct PersonalInfoCard: View {
    @State private var firstName = "张"
    @State private var lastName = "三"
    @State private var age = 20
    @State private var city = "北京"
    @State private var isStudent = true
    
    var fullName: String {
        firstName + lastName
    }
    
    var personalInfo: String {
        """
        姓名：\(fullName)
        年龄：\(age) 岁
        城市：\(city)
        身份：\(isStudent ? "学生" : "职场人士")
        状态：正在学习 Swift 🚀
        """
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("👤 个人信息生成器")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 12) {
                HStack {
                    Text("姓：")
                    TextField("姓", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("名：")
                    TextField("名", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack {
                    Text("年龄：")
                    Stepper("\(age) 岁", value: $age, in: 1...100)
                }
                
                HStack {
                    Text("城市：")
                    TextField("城市", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack {
                    Toggle("是学生", isOn: $isStudent)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("生成的个人信息：")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(personalInfo)
                        .font(.body)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 温度转换器
struct TemperatureConverterCard: View {
    @State private var celsius: Double = 25
    
    var fahrenheit: Double {
        celsius * 9/5 + 32
    }
    
    var kelvin: Double {
        celsius + 273.15
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🌡️ 温度转换器")
                .font(.headline)
                .foregroundColor(.red)
            
            VStack(spacing: 16) {
                // 摄氏度输入
                VStack(alignment: .leading) {
                    HStack {
                        Text("摄氏度：\(String(format: "%.1f", celsius))°C")
                        Spacer()
                    }
                    Slider(value: $celsius, in: -40...100, step: 0.1)
                        .accentColor(.red)
                }
                
                Divider()
                
                // 转换结果
                VStack(spacing: 12) {
                    TemperatureRow(
                        title: "华氏度",
                        value: fahrenheit,
                        unit: "°F",
                        color: .orange
                    )
                    
                    TemperatureRow(
                        title: "开尔文",
                        value: kelvin,
                        unit: "K",
                        color: .blue
                    )
                }
                
                // 转换公式
                VStack(alignment: .leading, spacing: 4) {
                    Text("转换公式：")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("°F = °C × 9/5 + 32")
                        .font(.system(.caption, design: .monospaced))
                    
                    Text("K = °C + 273.15")
                        .font(.system(.caption, design: .monospaced))
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .background(Color.red.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 温度行组件
struct TemperatureRow: View {
    let title: String
    let value: Double
    let unit: String
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(title)：")
            Spacer()
            Text("\(String(format: "%.1f", value)) \(unit)")
                .fontWeight(.semibold)
                .foregroundColor(color)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Day2 交互式闭包练习
struct InteractiveClosureCard: View {
    @State private var numbers = [1, 2, 3, 4, 5]
    @State private var selectedOperation = "map"
    
    let operations = ["map", "filter", "reduce"]
    
    var operationResult: [String] {
        switch selectedOperation {
        case "map":
            return numbers.map { "(\($0) * 2) = \($0 * 2)" }
        case "filter":
            return numbers.filter { $0 % 2 == 0 }.map { "\($0) (偶数)" }
        case "reduce":
            let sum = numbers.reduce(0, +)
            return ["所有数字相加 = \(sum)"]
        default:
            return []
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🎮 闭包操作练习")
                .font(.headline)
                .foregroundColor(.purple)
            
            VStack(spacing: 16) {
                // 原始数组
                VStack(alignment: .leading, spacing: 8) {
                    Text("原始数组：")
                        .font(.subheadline)
                    Text(numbers.map { String($0) }.joined(separator: ", "))
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .font(.system(.body, design: .monospaced))
                }
                
                // 操作选择
                Picker("选择操作", selection: $selectedOperation) {
                    Text("map - 转换").tag("map")
                    Text("filter - 筛选").tag("filter")
                    Text("reduce - 聚合").tag("reduce")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // 操作结果
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(selectedOperation) 操作结果：")
                        .font(.subheadline)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(operationResult, id: \.self) { result in
                            Text(result)
                                .font(.system(.body, design: .monospaced))
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(8)
                }
                
                // 操作说明
                Text(getOperationDescription())
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
        }
        .padding()
        .background(Color.purple.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getOperationDescription() -> String {
        switch selectedOperation {
        case "map":
            return "map: 对每个元素执行相同操作，返回新数组"
        case "filter":
            return "filter: 筛选符合条件的元素，返回新数组"
        case "reduce":
            return "reduce: 将所有元素合并为单个值"
        default:
            return ""
        }
    }
}

// MARK: - 数组操作练习卡片
struct ArrayOperationsCard: View {
    @State private var array = ["Swift", "iOS", "Xcode"]
    @State private var newElement = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📝 数组操作练习")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 12) {
                // 当前数组显示
                VStack(alignment: .leading, spacing: 8) {
                    Text("当前数组：")
                        .font(.subheadline)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 8) {
                        ForEach(Array(array.enumerated()), id: \.offset) { index, item in
                            HStack {
                                Text("[\(index)]")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(item)
                                    .font(.body)
                                    .fontWeight(.medium)
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(6)
                        }
                    }
                }
                
                Divider()
                
                // 添加新元素
                HStack {
                    TextField("输入新元素", text: $newElement)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("添加") {
                        if !newElement.isEmpty {
                            array.append(newElement)
                            newElement = ""
                        }
                    }
                    .disabled(newElement.isEmpty)
                }
                
                // 操作按钮
                HStack {
                    Button("删除首个") {
                        if !array.isEmpty {
                            array.removeFirst()
                        }
                    }
                    .disabled(array.isEmpty)
                    
                    Button("删除末尾") {
                        if !array.isEmpty {
                            array.removeLast()
                        }
                    }
                    .disabled(array.isEmpty)
                    
                    Button("排序") {
                        array.sort()
                    }
                    
                    Button("重置") {
                        array = ["Swift", "iOS", "Xcode"]
                    }
                }
                .font(.caption)
                
                Text("数组长度：\(array.count) | 是否为空：\(array.isEmpty ? "是" : "否")")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 集合类型对比卡片
struct CollectionComparisonCard: View {
    @State private var arrayItems = ["Apple", "Banana", "Apple", "Orange"]
    @State private var setItems: Set<String> = ["Apple", "Banana", "Orange"]
    @State private var dictItems = ["Apple": "苹果", "Banana": "香蕉", "Orange": "橙子"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🔍 集合类型对比")
                .font(.headline)
                .foregroundColor(.orange)
            
            VStack(spacing: 16) {
                // Array
                VStack(alignment: .leading, spacing: 4) {
                    Text("Array（数组）- 有序，可重复")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(arrayItems.joined(separator: " → "))
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(8)
                        .font(.system(.body, design: .monospaced))
                }
                
                // Set
                VStack(alignment: .leading, spacing: 4) {
                    Text("Set（集合）- 无序，自动去重")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(setItems.sorted().joined(separator: " • "))
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        .font(.system(.body, design: .monospaced))
                }
                
                // Dictionary
                VStack(alignment: .leading, spacing: 4) {
                    Text("Dictionary（字典）- 键值对存储")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(dictItems.keys.sorted(), id: \.self) { key in
                            Text("\(key): \(dictItems[key] ?? "")")
                                .font(.system(.caption, design: .monospaced))
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            
            Text("💡 选择合适的集合类型：需要顺序用Array，需要唯一性用Set，需要键值对用Dictionary")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top)
        }
        .padding()
        .background(Color.orange.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 学生成绩管理器
struct StudentGradeManagerCard: View {
    @State private var students: [String: Int] = ["小明": 85, "小红": 92, "小李": 78]
    @State private var newStudentName = ""
    @State private var newStudentGrade = 80
    
    var averageGrade: Double {
        guard !students.isEmpty else { return 0 }
        let sum = students.values.reduce(0, +)
        return Double(sum) / Double(students.count)
    }
    
    var topStudent: (name: String, grade: Int)? {
        if let maxStudent = students.max(by: { $0.value < $1.value }) {
            return (name: maxStudent.key, grade: maxStudent.value)
        }
        return nil
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("👨‍🎓 学生成绩管理器")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 16) {
                // 学生列表
                VStack(alignment: .leading, spacing: 8) {
                    Text("班级成绩单：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    ForEach(students.keys.sorted(), id: \.self) { name in
                        HStack {
                            Text(name)
                            Spacer()
                            Text("\(students[name] ?? 0)分")
                                .fontWeight(.medium)
                                .foregroundColor(getGradeColor(students[name] ?? 0))
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                
                // 统计信息
                VStack(spacing: 8) {
                    HStack {
                        Text("平均分：")
                        Spacer()
                        Text(String(format: "%.1f", averageGrade))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    
                    if let top = topStudent {
                        HStack {
                            Text("最高分：")
                            Spacer()
                            Text("\(top.name) - \(top.grade)分")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
                
                // 添加新学生
                VStack(spacing: 8) {
                    HStack {
                        TextField("学生姓名", text: $newStudentName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Stepper("分数: \(newStudentGrade)", value: $newStudentGrade, in: 0...100)
                            .frame(width: 120)
                    }
                    
                    Button("添加学生") {
                        if !newStudentName.isEmpty {
                            students[newStudentName] = newStudentGrade
                            newStudentName = ""
                            newStudentGrade = 80
                        }
                    }
                    .disabled(newStudentName.isEmpty)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getGradeColor(_ grade: Int) -> Color {
        switch grade {
        case 90...100: return .green
        case 80..<90: return .blue
        case 70..<80: return .orange
        default: return .red
        }
    }
}

// MARK: - 数组操作练习器
struct ArrayOperationPracticeCard: View {
    @State private var originalArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @State private var selectedOperations: Set<String> = []
    
    let operationOptions = ["偶数筛选", "平方映射", "大于5", "求和"]
    
    var processedArray: [Int] {
        var result = originalArray
        
        if selectedOperations.contains("偶数筛选") {
            result = result.filter { $0 % 2 == 0 }
        }
        
        if selectedOperations.contains("平方映射") {
            result = result.map { $0 * $0 }
        }
        
        if selectedOperations.contains("大于5") {
            result = result.filter { $0 > 5 }
        }
        
        return result
    }
    
    var finalSum: Int {
        if selectedOperations.contains("求和") {
            return processedArray.reduce(0, +)
        }
        return 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🧮 数组操作链练习")
                .font(.headline)
                .foregroundColor(.green)
            
            VStack(spacing: 16) {
                // 原始数组
                VStack(alignment: .leading, spacing: 4) {
                    Text("原始数组：")
                        .font(.subheadline)
                    Text(originalArray.map { String($0) }.joined(separator: ", "))
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .font(.system(.body, design: .monospaced))
                }
                
                // 操作选择
                VStack(alignment: .leading, spacing: 8) {
                    Text("选择操作（按顺序执行）：")
                        .font(.subheadline)
                    
                    ForEach(operationOptions, id: \.self) { operation in
                        HStack {
                            Button(action: {
                                if selectedOperations.contains(operation) {
                                    selectedOperations.remove(operation)
                                } else {
                                    selectedOperations.insert(operation)
                                }
                            }) {
                                HStack {
                                    Image(systemName: selectedOperations.contains(operation) ? "checkmark.square.fill" : "square")
                                        .foregroundColor(selectedOperations.contains(operation) ? .green : .gray)
                                    Text(operation)
                                        .foregroundColor(.primary)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                        }
                    }
                }
                
                // 结果显示
                if !selectedOperations.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("处理结果：")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        if !selectedOperations.contains("求和") {
                            Text(processedArray.map { String($0) }.joined(separator: ", "))
                                .padding()
                                .background(Color.green.opacity(0.1))
                                .cornerRadius(8)
                                .font(.system(.body, design: .monospaced))
                        } else {
                            Text("最终求和结果：\(finalSum)")
                                .padding()
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(8)
                                .font(.system(.title3, design: .monospaced))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 购物清单管理器
struct ShoppingListManagerCard: View {
    @State private var shoppingList: [String: Bool] = [
        "苹果": false,
        "牛奶": true,
        "面包": false,
        "鸡蛋": true
    ]
    @State private var newItem = ""
    
    var completedItems: [String] {
        shoppingList.compactMap { $0.value ? $0.key : nil }.sorted()
    }
    
    var pendingItems: [String] {
        shoppingList.compactMap { !$0.value ? $0.key : nil }.sorted()
    }
    
    var completionRate: Double {
        guard !shoppingList.isEmpty else { return 0 }
        let completed = shoppingList.values.filter { $0 }.count
        return Double(completed) / Double(shoppingList.count)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🛒 购物清单管理器")
                .font(.headline)
                .foregroundColor(.orange)
            
            VStack(spacing: 16) {
                // 完成进度
                VStack(spacing: 8) {
                    HStack {
                        Text("完成进度")
                        Spacer()
                        Text("\(Int(completionRate * 100))%")
                            .fontWeight(.bold)
                    }
                    
                    ProgressView(value: completionRate)
                        .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(8)
                
                // 购物清单
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(shoppingList.keys.sorted(), id: \.self) { item in
                        HStack {
                            Button(action: {
                                shoppingList[item]?.toggle()
                            }) {
                                HStack {
                                    Image(systemName: shoppingList[item] == true ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(shoppingList[item] == true ? .green : .gray)
                                    
                                    Text(item)
                                        .strikethrough(shoppingList[item] == true)
                                        .foregroundColor(shoppingList[item] == true ? .secondary : .primary)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                            
                            Button("删除") {
                                shoppingList.removeValue(forKey: item)
                            }
                            .font(.caption)
                            .foregroundColor(.red)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(8)
                    }
                }
                
                // 添加新物品
                HStack {
                    TextField("添加购物物品", text: $newItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("添加") {
                        if !newItem.isEmpty && !shoppingList.keys.contains(newItem) {
                            shoppingList[newItem] = false
                            newItem = ""
                        }
                    }
                    .disabled(newItem.isEmpty || shoppingList.keys.contains(newItem))
                }
                
                // 统计信息
                HStack {
                    Text("待购：\(pendingItems.count)")
                        .foregroundColor(.orange)
                    
                    Text("已购：\(completedItems.count)")
                        .foregroundColor(.green)
                    
                    Spacer()
                    
                    Text("总计：\(shoppingList.count)")
                        .fontWeight(.medium)
                }
                .font(.caption)
            }
        }
        .padding()
        .background(Color.orange.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - Day 3 交互式组件

// MARK: - 温度判断器
struct TemperatureJudgeCard: View {
    @State private var temperature: Double = 25
    
    var temperatureMessage: (message: String, color: Color) {
        switch temperature {
        case ..<0:
            return ("天气严寒，注意保暖！", .blue)
        case 0..<10:
            return ("天气寒冷，多穿衣服", .cyan)
        case 10..<20:
            return ("天气凉爽，很舒适", .green)
        case 20..<30:
            return ("天气温暖，刚刚好", .orange)
        case 30..<35:
            return ("天气炎热，注意防晒", .red)
        default:
            return ("天气酷热，尽量待在室内", .red)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🌡️ 温度条件判断")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 16) {
                // 温度滑块
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("当前温度：\(String(format: "%.1f", temperature))°C")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    
                    Slider(value: $temperature, in: -10...45, step: 0.5)
                        .accentColor(.blue)
                }
                
                // 判断结果
                VStack(spacing: 8) {
                    Text("温度判断结果：")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(temperatureMessage.message)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(temperatureMessage.color)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(temperatureMessage.color.opacity(0.1))
                        .cornerRadius(8)
                }
                
                // 条件逻辑展示
                VStack(alignment: .leading, spacing: 4) {
                    Text("if-else 逻辑：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    let currentRange = getCurrentRange(temperature)
                    Text(currentRange)
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getCurrentRange(_ temp: Double) -> String {
        switch temp {
        case ..<0:
            return "if temperature < 0 { /* 严寒 */ }"
        case 0..<10:
            return "else if temperature < 10 { /* 寒冷 */ }"
        case 10..<20:
            return "else if temperature < 20 { /* 凉爽 */ }"
        case 20..<30:
            return "else if temperature < 30 { /* 温暖 */ }"
        case 30..<35:
            return "else if temperature < 35 { /* 炎热 */ }"
        default:
            return "else { /* 酷热 */ }"
        }
    }
}

// MARK: - 成绩评定器
struct GradeEvaluatorCard: View {
    @State private var score: Double = 85
    @State private var subject = "数学"
    
    let subjects = ["数学", "英语", "语文", "物理", "化学"]
    
    var gradeInfo: (grade: String, level: String, color: Color, message: String) {
        switch score {
        case 95...100:
            return ("A+", "优秀", .green, "表现卓越，继续保持！")
        case 90..<95:
            return ("A", "优秀", .green, "成绩优异，非常棒！")
        case 85..<90:
            return ("B+", "良好", .blue, "表现不错，再接再厉！")
        case 80..<85:
            return ("B", "良好", .blue, "基础扎实，继续努力！")
        case 75..<80:
            return ("C+", "中等", .orange, "还需努力，加油！")
        case 70..<75:
            return ("C", "中等", .orange, "需要更加努力学习")
        case 60..<70:
            return ("D", "及格", .red, "刚好及格，要加强练习")
        default:
            return ("F", "不及格", .red, "需要重新学习，不要放弃！")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📊 成绩等级评定")
                .font(.headline)
                .foregroundColor(.green)
            
            VStack(spacing: 16) {
                // 科目选择
                VStack(alignment: .leading, spacing: 8) {
                    Text("选择科目：")
                        .font(.subheadline)
                    
                    Picker("科目", selection: $subject) {
                        ForEach(subjects, id: \.self) { subj in
                            Text(subj).tag(subj)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // 分数输入
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("\(subject)成绩：\(String(format: "%.0f", score))分")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    
                    Slider(value: $score, in: 0...100, step: 1)
                        .accentColor(.green)
                }
                
                // 等级评定结果
                VStack(spacing: 12) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("等级评定")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                Text(gradeInfo.grade)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(gradeInfo.color)
                                
                                VStack(alignment: .leading) {
                                    Text(gradeInfo.level)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(gradeInfo.color)
                                    
                                    Text("\(String(format: "%.0f", score))分")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    
                    Text(gradeInfo.message)
                        .font(.body)
                        .foregroundColor(gradeInfo.color)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(gradeInfo.color.opacity(0.1))
                        .cornerRadius(8)
                }
                
                // Switch语句代码示例
                VStack(alignment: .leading, spacing: 4) {
                    Text("对应的 switch 代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(getSwitchCode())
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getSwitchCode() -> String {
        switch score {
        case 95...100:
            return "case 95...100: return \"A+\""
        case 90..<95:
            return "case 90..<95: return \"A\""
        case 85..<90:
            return "case 85..<90: return \"B+\""
        case 80..<85:
            return "case 80..<85: return \"B\""
        case 75..<80:
            return "case 75..<80: return \"C+\""
        case 70..<75:
            return "case 70..<75: return \"C\""
        case 60..<70:
            return "case 60..<70: return \"D\""
        default:
            return "default: return \"F\""
        }
    }
}

// MARK: - 数列生成器
struct NumberSequenceCard: View {
    @State private var startNumber = 1
    @State private var endNumber = 10
    @State private var stepSize = 1
    @State private var sequenceType = "递增"
    
    let sequenceTypes = ["递增", "递减", "偶数", "奇数", "平方"]
    
    var generatedSequence: [Int] {
        switch sequenceType {
        case "递增":
            return Array(stride(from: startNumber, through: endNumber, by: stepSize))
        case "递减":
            return Array(stride(from: endNumber, through: startNumber, by: -stepSize))
        case "偶数":
            return Array(stride(from: startNumber, through: endNumber, by: stepSize)).filter { $0 % 2 == 0 }
        case "奇数":
            return Array(stride(from: startNumber, through: endNumber, by: stepSize)).filter { $0 % 2 == 1 }
        case "平方":
            return Array(stride(from: startNumber, through: endNumber, by: stepSize)).map { $0 * $0 }
        default:
            return []
        }
    }
    
    var forLoopCode: String {
        switch sequenceType {
        case "递增":
            return "for i in \(startNumber)...\(endNumber) { print(i) }"
        case "递减":
            return "for i in (\(startNumber)...\(endNumber)).reversed() { print(i) }"
        case "偶数":
            return "for i in \(startNumber)...\(endNumber) where i % 2 == 0 { print(i) }"
        case "奇数":
            return "for i in \(startNumber)...\(endNumber) where i % 2 == 1 { print(i) }"
        case "平方":
            return "for i in \(startNumber)...\(endNumber) { print(i * i) }"
        default:
            return ""
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🔢 for循环数列生成器")
                .font(.headline)
                .foregroundColor(.purple)
            
            VStack(spacing: 16) {
                // 参数设置
                VStack(spacing: 12) {
                    HStack {
                        Text("起始：")
                        Stepper("\(startNumber)", value: $startNumber, in: 1...50)
                            .frame(width: 80)
                        
                        Spacer()
                        
                        Text("结束：")
                        Stepper("\(endNumber)", value: $endNumber, in: startNumber...50)
                            .frame(width: 80)
                    }
                    
                    HStack {
                        Text("步长：")
                        Stepper("\(stepSize)", value: $stepSize, in: 1...10)
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("序列类型：")
                            .font(.subheadline)
                        
                        Picker("序列类型", selection: $sequenceType) {
                            ForEach(sequenceTypes, id: \.self) { type in
                                Text(type).tag(type)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                // 生成的序列
                VStack(alignment: .leading, spacing: 8) {
                    Text("生成的数列：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 4) {
                            ForEach(Array(generatedSequence.enumerated()), id: \.offset) { index, number in
                                Text("\(number)")
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.purple.opacity(0.1))
                                    .cornerRadius(6)
                                    .font(.system(.body, design: .monospaced))
                                
                                if index < generatedSequence.count - 1 {
                                    Text("→")
                                        .foregroundColor(.purple)
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("数量：\(generatedSequence.count)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // 对应代码
                VStack(alignment: .leading, spacing: 4) {
                    Text("对应的for循环代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(forLoopCode)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.purple.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 倒计时器
struct CountdownTimerCard: View {
    @State private var startCount = 10
    @State private var currentCount = 10
    @State private var isCountingDown = false
    @State private var countdownTimer: Timer?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("⏱️ while循环倒计时器")
                .font(.headline)
                .foregroundColor(.red)
            
            VStack(spacing: 16) {
                // 倒计时设置
                if !isCountingDown {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("倒计时起始数：\(startCount)")
                            Spacer()
                        }
                        
                        Slider(value: Binding(
                            get: { Double(startCount) },
                            set: { 
                                startCount = Int($0)
                                currentCount = startCount
                            }
                        ), in: 5...30, step: 1)
                            .accentColor(.red)
                    }
                }
                
                // 倒计时显示
                VStack(spacing: 12) {
                    Text("\(currentCount)")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(currentCount <= 3 ? .red : .primary)
                        .scaleEffect(currentCount <= 3 ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.3), value: currentCount)
                    
                    if currentCount == 0 {
                        Text("时间到！🎉")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .scaleEffect(1.1)
                            .animation(.bouncy, value: currentCount)
                    }
                }
                
                // 控制按钮
                HStack(spacing: 16) {
                    Button(action: {
                        if isCountingDown {
                            stopCountdown()
                        } else {
                            startCountdown()
                        }
                    }) {
                        Text(isCountingDown ? "停止" : "开始")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(isCountingDown ? Color.red : Color.green)
                            .cornerRadius(8)
                    }
                    
                    Button("重置") {
                        resetCountdown()
                    }
                    .disabled(isCountingDown)
                }
                
                // while循环逻辑展示
                VStack(alignment: .leading, spacing: 4) {
                    Text("while循环逻辑：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("var count = \(startCount)")
                        Text("while count > 0 {")
                        Text("    print(count)")
                        Text("    count -= 1")
                        Text("}")
                    }
                    .font(.system(.caption, design: .monospaced))
                    .foregroundColor(.secondary)
                    .padding()
                    .background(Color.red.opacity(0.05))
                    .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.red.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func startCountdown() {
        isCountingDown = true
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if currentCount > 0 {
                currentCount -= 1
            } else {
                stopCountdown()
            }
        }
    }
    
    private func stopCountdown() {
        isCountingDown = false
        countdownTimer?.invalidate()
        countdownTimer = nil
    }
    
    private func resetCountdown() {
        stopCountdown()
        currentCount = startCount
    }
}

// MARK: - Day 3 练习组件

// MARK: - 数字猜测游戏
struct NumberGuessGameCard: View {
    @State private var secretNumber = Int.random(in: 1...100)
    @State private var userGuess = ""
    @State private var guessHistory: [(guess: Int, result: String)] = []
    @State private var gameStatus = "进行中"
    @State private var attempts = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🎯 数字猜测游戏")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 16) {
                // 游戏说明
                Text("我想了一个1到100之间的数字，你能猜出来吗？")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                
                // 游戏状态
                VStack(spacing: 8) {
                    HStack {
                        Text("状态：")
                        Spacer()
                        Text(gameStatus)
                            .fontWeight(.semibold)
                            .foregroundColor(gameStatus == "猜中了！" ? .green : .orange)
                    }
                    
                    HStack {
                        Text("尝试次数：")
                        Spacer()
                        Text("\(attempts)")
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                
                // 输入和猜测
                if gameStatus == "进行中" {
                    HStack {
                        TextField("输入1-100的数字", text: $userGuess)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        
                        Button("猜测") {
                            makeGuess()
                        }
                        .disabled(userGuess.isEmpty || Int(userGuess) == nil)
                    }
                }
                
                // 猜测历史
                if !guessHistory.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("猜测历史：")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        ScrollView {
                            LazyVStack(spacing: 4) {
                                ForEach(Array(guessHistory.enumerated()), id: \.offset) { index, record in
                                    HStack {
                                        Text("\(index + 1).")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        
                                        Text("\(record.guess)")
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        Text(record.result)
                                            .font(.caption)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 2)
                                            .background(getResultColor(record.result).opacity(0.2))
                                            .foregroundColor(getResultColor(record.result))
                                            .cornerRadius(4)
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: 120)
                    }
                }
                
                // 重新开始按钮
                if gameStatus == "猜中了！" {
                    Button("重新开始") {
                        resetGame()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func makeGuess() {
        guard let guess = Int(userGuess) else { return }
        
        attempts += 1
        
        let result: String
        if guess == secretNumber {
            result = "猜中了！🎉"
            gameStatus = "猜中了！"
        } else if guess < secretNumber {
            result = "太小了"
        } else {
            result = "太大了"
        }
        
        guessHistory.append((guess: guess, result: result))
        userGuess = ""
    }
    
    private func resetGame() {
        secretNumber = Int.random(in: 1...100)
        userGuess = ""
        guessHistory.removeAll()
        gameStatus = "进行中"
        attempts = 0
    }
    
    private func getResultColor(_ result: String) -> Color {
        switch result {
        case "猜中了！🎉": return .green
        case "太大了": return .red
        case "太小了": return .blue
        default: return .gray
        }
    }
}

// MARK: - 成绩统计分析器
struct GradeStatisticsCard: View {
    @State private var grades: [Int] = [78, 85, 92, 67, 88, 94, 76, 89, 91, 82]
    @State private var newGrade = ""
    
    var statistics: (average: Double, highest: Int, lowest: Int, passed: Int, failed: Int) {
        guard !grades.isEmpty else { return (0, 0, 0, 0, 0) }
        
        let sum = grades.reduce(0, +)
        let average = Double(sum) / Double(grades.count)
        let highest = grades.max() ?? 0
        let lowest = grades.min() ?? 0
        let passed = grades.filter { $0 >= 60 }.count
        let failed = grades.count - passed
        
        return (average, highest, lowest, passed, failed)
    }
    
    var gradeDistribution: [String: Int] {
        var distribution: [String: Int] = ["优秀(90+)": 0, "良好(80-89)": 0, "中等(70-79)": 0, "及格(60-69)": 0, "不及格(<60)": 0]
        
        for grade in grades {
            switch grade {
            case 90...100:
                distribution["优秀(90+)"]! += 1
            case 80..<90:
                distribution["良好(80-89)"]! += 1
            case 70..<80:
                distribution["中等(70-79)"]! += 1
            case 60..<70:
                distribution["及格(60-69)"]! += 1
            default:
                distribution["不及格(<60)"]! += 1
            }
        }
        
        return distribution
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📈 成绩统计分析器")
                .font(.headline)
                .foregroundColor(.green)
            
            VStack(spacing: 16) {
                // 当前成绩展示
                VStack(alignment: .leading, spacing: 8) {
                    Text("班级成绩（共\(grades.count)人）：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 8) {
                        ForEach(Array(grades.enumerated()), id: \.offset) { index, grade in
                            VStack {
                                Text("\(index + 1)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(grade)")
                                    .fontWeight(.medium)
                                    .foregroundColor(getGradeColor(grade))
                            }
                            .padding(.horizontal, 6)
                            .padding(.vertical, 4)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(6)
                        }
                    }
                }
                
                // 基本统计信息
                VStack(spacing: 8) {
                    HStack {
                        Text("平均分：")
                        Spacer()
                        Text(String(format: "%.1f", statistics.average))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    
                    HStack {
                        VStack {
                            Text("最高分")
                                .font(.caption)
                            Text("\(statistics.highest)")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("最低分")
                                .font(.caption)
                            Text("\(statistics.lowest)")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("及格人数")
                                .font(.caption)
                            Text("\(statistics.passed)")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("不及格人数")
                                .font(.caption)
                            Text("\(statistics.failed)")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
                
                // 等级分布
                VStack(alignment: .leading, spacing: 8) {
                    Text("等级分布：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    VStack(spacing: 4) {
                        ForEach(Array(gradeDistribution.keys.sorted()), id: \.self) { level in
                            HStack {
                                Text(level)
                                    .font(.caption)
                                
                                Spacer()
                                
                                Text("\(gradeDistribution[level] ?? 0)人")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                
                                // 简单的条形图
                                GeometryReader { geometry in
                                    Rectangle()
                                        .fill(getDistributionColor(level))
                                        .frame(width: geometry.size.width * CGFloat(gradeDistribution[level] ?? 0) / CGFloat(grades.count))
                                        .frame(height: 8)
                                }
                                .frame(width: 60, height: 8)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(4)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(8)
                
                // 添加新成绩
                HStack {
                    TextField("输入新成绩(0-100)", text: $newGrade)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    Button("添加") {
                        if let grade = Int(newGrade), grade >= 0 && grade <= 100 {
                            grades.append(grade)
                            newGrade = ""
                        }
                    }
                    .disabled(newGrade.isEmpty || Int(newGrade) == nil)
                }
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getGradeColor(_ grade: Int) -> Color {
        switch grade {
        case 90...100: return .green
        case 80..<90: return .blue
        case 70..<80: return .orange
        case 60..<70: return .yellow
        default: return .red
        }
    }
    
    private func getDistributionColor(_ level: String) -> Color {
        switch level {
        case "优秀(90+)": return .green
        case "良好(80-89)": return .blue
        case "中等(70-79)": return .orange
        case "及格(60-69)": return .yellow
        default: return .red
        }
    }
}

// MARK: - 密码验证器
struct PasswordValidatorCard: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var validationResults: [ValidationResult] {
        var results: [ValidationResult] = []
        
        // 长度检查
        if password.count >= 8 {
            results.append(ValidationResult(rule: "长度至少8位", passed: true))
        } else {
            results.append(ValidationResult(rule: "长度至少8位", passed: false))
        }
        
        // 包含数字
        let hasNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        results.append(ValidationResult(rule: "包含数字", passed: hasNumber))
        
        // 包含小写字母
        let hasLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        results.append(ValidationResult(rule: "包含小写字母", passed: hasLowercase))
        
        // 包含大写字母
        let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        results.append(ValidationResult(rule: "包含大写字母", passed: hasUppercase))
        
        // 包含特殊字符
        let specialCharacters = CharacterSet(charactersIn: "!@#$%^&*()_+-=[]{}|;:,.<>?")
        let hasSpecialChar = password.rangeOfCharacter(from: specialCharacters) != nil
        results.append(ValidationResult(rule: "包含特殊字符", passed: hasSpecialChar))
        
        // 确认密码匹配
        if !confirmPassword.isEmpty {
            results.append(ValidationResult(rule: "确认密码匹配", passed: password == confirmPassword))
        }
        
        return results
    }
    
    var passwordStrength: (strength: String, color: Color) {
        let passedRules = validationResults.filter { $0.passed }.count
        
        switch passedRules {
        case 0...2:
            return ("弱", .red)
        case 3...4:
            return ("中等", .orange)
        case 5:
            return ("强", .green)
        default:
            return ("很强", .blue)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🔐 密码强度验证器")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 16) {
                // 密码输入
                VStack(spacing: 8) {
                    SecureField("输入密码", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("确认密码", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // 密码强度显示
                if !password.isEmpty {
                    HStack {
                        Text("密码强度：")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text(passwordStrength.strength)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(passwordStrength.color)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(passwordStrength.color.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
                
                // 验证规则列表
                VStack(alignment: .leading, spacing: 8) {
                    Text("密码要求：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    ForEach(validationResults, id: \.rule) { result in
                        HStack {
                            Image(systemName: result.passed ? "checkmark.circle.fill" : "xmark.circle")
                                .foregroundColor(result.passed ? .green : .gray)
                            
                            Text(result.rule)
                                .font(.body)
                                .foregroundColor(result.passed ? .primary : .secondary)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(8)
                
                // 验证逻辑展示
                if !password.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("验证逻辑示例：")
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("guard password.count >= 8 else { return false }")
                            Text("guard password.contains { $0.isNumber } else { return false }")
                            Text("guard password.contains { $0.isLowercase } else { return false }")
                            Text("// 更多验证规则...")
                        }
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(6)
                    }
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
}

struct ValidationResult {
    let rule: String
    let passed: Bool
}

// MARK: - FizzBuzz游戏
struct FizzBuzzGameCard: View {
    @State private var maxNumber = 20
    @State private var showResults = false
    
    var fizzBuzzResults: [(number: Int, result: String)] {
        var results: [(number: Int, result: String)] = []
        
        for i in 1...maxNumber {
            let result: String
            if i % 15 == 0 {
                result = "FizzBuzz"
            } else if i % 3 == 0 {
                result = "Fizz"
            } else if i % 5 == 0 {
                result = "Buzz"
            } else {
                result = "\(i)"
            }
            
            results.append((number: i, result: result))
        }
        
        return results
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🎲 FizzBuzz 编程游戏")
                .font(.headline)
                .foregroundColor(.orange)
            
            VStack(spacing: 16) {
                // 游戏说明
                VStack(alignment: .leading, spacing: 8) {
                    Text("FizzBuzz 规则：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("• 能被3整除的数字 → Fizz")
                        Text("• 能被5整除的数字 → Buzz")
                        Text("• 能被15整除的数字 → FizzBuzz")
                        Text("• 其他数字 → 保持原样")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(8)
                
                // 数字范围设置
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("游戏范围：1 到 \(maxNumber)")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    
                    Slider(value: Binding(
                        get: { Double(maxNumber) },
                        set: { maxNumber = Int($0) }
                    ), in: 10...50, step: 1)
                        .accentColor(.orange)
                }
                
                // 开始游戏按钮
                Button(action: {
                    showResults = true
                }) {
                    Text("开始 FizzBuzz 游戏")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(8)
                }
                
                // 游戏结果
                if showResults {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("FizzBuzz 结果：")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        ScrollView {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 8) {
                                ForEach(fizzBuzzResults, id: \.number) { item in
                                    Text(item.result)
                                        .font(.system(.body, design: .monospaced))
                                        .fontWeight(.medium)
                                        .foregroundColor(getFizzBuzzColor(item.result))
                                        .frame(minWidth: 50, minHeight: 30)
                                        .background(getFizzBuzzColor(item.result).opacity(0.1))
                                        .cornerRadius(6)
                                }
                            }
                        }
                        .frame(maxHeight: 200)
                    }
                }
                
                // 对应的代码逻辑
                VStack(alignment: .leading, spacing: 4) {
                    Text("FizzBuzz 代码逻辑：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        Text("for i in 1...\(maxNumber) {")
                        Text("    if i % 15 == 0 { print(\"FizzBuzz\") }")
                        Text("    else if i % 3 == 0 { print(\"Fizz\") }")
                        Text("    else if i % 5 == 0 { print(\"Buzz\") }")
                        Text("    else { print(i) }")
                        Text("}")
                    }
                    .font(.system(.caption, design: .monospaced))
                    .foregroundColor(.secondary)
                    .padding()
                    .background(Color.orange.opacity(0.05))
                    .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getFizzBuzzColor(_ result: String) -> Color {
        switch result {
        case "Fizz":
            return .blue
        case "Buzz":
            return .green
        case "FizzBuzz":
            return .purple
        default:
            return .gray
        }
    }
}

// MARK: - Day 4 交互式组件

// MARK: - 可选类型解析器
struct OptionalExplorerCard: View {
    @State private var inputText = "Swift"
    @State private var isNil = false
    @State private var selectedOperation = "检查值"
    
    let operations = ["检查值", "强制解包", "可选绑定", "nil合并"]
    
    var optionalValue: String? {
        return isNil ? nil : (inputText.isEmpty ? nil : inputText)
    }
    
    var operationResult: (result: String, isSuccess: Bool) {
        switch selectedOperation {
        case "检查值":
            if optionalValue != nil {
                return ("值存在: \"\(optionalValue!)\"", true)
            } else {
                return ("值为 nil", false)
            }
        case "强制解包":
            if optionalValue != nil {
                return ("强制解包成功: \"\(optionalValue!)\"", true)
            } else {
                return ("⚠️ 强制解包会崩溃！", false)
            }
        case "可选绑定":
            if let value = optionalValue {
                return ("if let 绑定成功: \"\(value)\"", true)
            } else {
                return ("if let 绑定失败，执行 else 分支", false)
            }
        case "nil合并":
            let result = optionalValue ?? "默认值"
            return ("nil合并结果: \"\(result)\"", true)
        default:
            return ("", true)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("❓ 可选类型解析器")
                .font(.headline)
                .foregroundColor(.orange)
            
            VStack(spacing: 16) {
                // 输入控制
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("输入值：")
                        TextField("输入文本", text: $inputText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(isNil)
                    }
                    
                    Toggle("设为 nil", isOn: $isNil)
                }
                
                // 可选值状态展示
                VStack(alignment: .leading, spacing: 8) {
                    Text("可选值状态：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text("String?")
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        if let value = optionalValue {
                            Text("Optional(\"\(value)\")")
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.green)
                        } else {
                            Text("nil")
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                // 操作选择
                VStack(alignment: .leading, spacing: 8) {
                    Text("选择操作：")
                        .font(.subheadline)
                    
                    Picker("操作", selection: $selectedOperation) {
                        ForEach(operations, id: \.self) { operation in
                            Text(operation).tag(operation)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // 操作结果
                VStack(alignment: .leading, spacing: 8) {
                    Text("操作结果：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text(operationResult.result)
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(operationResult.isSuccess ? .green : .red)
                        .padding()
                        .background(operationResult.isSuccess ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                        .cornerRadius(8)
                }
                
                // 对应代码展示
                VStack(alignment: .leading, spacing: 4) {
                    Text("对应的Swift代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(getSwiftCode())
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.orange.opacity(0.05))
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getSwiftCode() -> String {
        let valueDeclaration = isNil ? "let value: String? = nil" : "let value: String? = \"\(inputText)\""
        
        switch selectedOperation {
        case "检查值":
            return """
            \(valueDeclaration)
            if value != nil {
                print("值存在")
            } else {
                print("值为 nil")
            }
            """
        case "强制解包":
            return """
            \(valueDeclaration)
            let result = value!  // 危险操作
            """
        case "可选绑定":
            return """
            \(valueDeclaration)
            if let unwrapped = value {
                print("绑定成功: \\(unwrapped)")
            } else {
                print("绑定失败")
            }
            """
        case "nil合并":
            return """
            \(valueDeclaration)
            let result = value ?? "默认值"
            """
        default:
            return ""
        }
    }
}

// MARK: - 可选绑定练习器
struct OptionalBindingPracticeCard: View {
    @State private var name: String = "小明"
    @State private var age: String = "25"
    @State private var email: String = ""
    @State private var phone: String = ""
    
    var bindingResults: [(field: String, success: Bool, value: String)] {
        var results: [(String, Bool, String)] = []
        
        // 姓名绑定
        if !name.isEmpty {
            results.append(("姓名", true, name))
        } else {
            results.append(("姓名", false, "绑定失败"))
        }
        
        // 年龄绑定
        if let ageInt = Int(age) {
            results.append(("年龄", true, "\(ageInt)岁"))
        } else {
            results.append(("年龄", false, "无效年龄"))
        }
        
        // 邮箱绑定
        if !email.isEmpty && email.contains("@") {
            results.append(("邮箱", true, email))
        } else {
            results.append(("邮箱", false, email.isEmpty ? "未填写" : "格式错误"))
        }
        
        // 手机绑定
        if !phone.isEmpty && phone.count >= 11 {
            results.append(("手机", true, phone))
        } else {
            results.append(("手机", false, phone.isEmpty ? "未填写" : "号码太短"))
        }
        
        return results
    }
    
    var canProceed: Bool {
        return bindingResults.filter { $0.success }.count >= 2
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🔗 可选绑定练习器")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 16) {
                // 输入表单
                VStack(spacing: 12) {
                    HStack {
                        Text("姓名：")
                            .frame(width: 50, alignment: .leading)
                        TextField("请输入姓名", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("年龄：")
                            .frame(width: 50, alignment: .leading)
                        TextField("请输入年龄", text: $age)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                    
                    HStack {
                        Text("邮箱：")
                            .frame(width: 50, alignment: .leading)
                        TextField("请输入邮箱（可选）", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    }
                    
                    HStack {
                        Text("手机：")
                            .frame(width: 50, alignment: .leading)
                        TextField("请输入手机（可选）", text: $phone)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                    }
                }
                
                // 绑定结果展示
                VStack(alignment: .leading, spacing: 8) {
                    Text("可选绑定结果：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    ForEach(bindingResults, id: \.field) { result in
                        HStack {
                            Image(systemName: result.success ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(result.success ? .green : .red)
                            
                            Text(result.field)
                                .font(.body)
                                .frame(width: 40, alignment: .leading)
                            
                            Text(result.value)
                                .font(.body)
                                .foregroundColor(result.success ? .primary : .secondary)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.05))
                .cornerRadius(8)
                
                // 处理结果
                VStack(spacing: 8) {
                    HStack {
                        Text("处理状态：")
                        Spacer()
                        Text(canProceed ? "✅ 可以继续" : "❌ 信息不足")
                            .fontWeight(.semibold)
                            .foregroundColor(canProceed ? .green : .red)
                    }
                    
                    if canProceed {
                        let successCount = bindingResults.filter { $0.success }.count
                        Text("成功绑定 \(successCount) 个字段，满足处理条件")
                            .font(.caption)
                            .foregroundColor(.green)
                    } else {
                        Text("至少需要2个有效字段才能继续处理")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                
                // guard let 示例代码
                VStack(alignment: .leading, spacing: 4) {
                    Text("对应的guard let代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("""
                    func processUser(name: String?, age: String?) {
                        guard !name.isEmpty,
                              let ageInt = Int(age) else {
                            print("用户信息不完整")
                            return
                        }
                        print("处理用户: \\(name), \\(ageInt)岁")
                    }
                    """)
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 安全解包对比器
struct SafeUnwrappingComparisonCard: View {
    @State private var inputValue = "Swift"
    @State private var makeNil = false
    @State private var selectedMethod = "可选绑定"
    
    let unwrappingMethods = ["可选绑定", "nil合并", "强制解包", "可选链"]
    
    var optionalString: String? {
        return makeNil ? nil : (inputValue.isEmpty ? nil : inputValue)
    }
    
    var methodResult: (code: String, result: String, safety: String, color: Color) {
        switch selectedMethod {
        case "可选绑定":
            let code = """
            if let value = optionalString {
                return "长度: \\(value.count)"
            } else {
                return "值为空"
            }
            """
            let result = optionalString != nil ? "长度: \(optionalString!.count)" : "值为空"
            return (code, result, "✅ 安全", .green)
            
        case "nil合并":
            let code = """
            let value = optionalString ?? "默认值"
            return "长度: \\(value.count)"
            """
            let value = optionalString ?? "默认值"
            let result = "长度: \(value.count)"
            return (code, result, "✅ 安全", .green)
            
        case "强制解包":
            let code = """
            let value = optionalString!
            return "长度: \\(value.count)"
            """
            let result = optionalString != nil ? "长度: \(optionalString!.count)" : "💥 运行时崩溃"
            let safety = optionalString != nil ? "⚠️ 危险但成功" : "❌ 会崩溃"
            let color: Color = optionalString != nil ? .orange : .red
            return (code, result, safety, color)
            
        case "可选链":
            let code = """
            let length = optionalString?.count
            return length != nil ? "长度: \\(length!)" : "无法获取长度"
            """
            let result = optionalString?.count != nil ? "长度: \(optionalString!.count)" : "无法获取长度"
            return (code, result, "✅ 安全", .green)
            
        default:
            return ("", "", "", .gray)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🛡️ 安全解包对比器")
                .font(.headline)
                .foregroundColor(.green)
            
            VStack(spacing: 16) {
                // 输入控制
                VStack(spacing: 8) {
                    HStack {
                        Text("字符串值：")
                        TextField("输入字符串", text: $inputValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(makeNil)
                    }
                    
                    Toggle("模拟nil值", isOn: $makeNil)
                }
                
                // 当前可选值状态
                VStack(alignment: .leading, spacing: 4) {
                    Text("当前可选值：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text(optionalString != nil ? "Optional(\"\(optionalString!)\")" : "nil")
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(optionalString != nil ? .green : .red)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(6)
                }
                
                // 解包方法选择
                VStack(alignment: .leading, spacing: 8) {
                    Text("选择解包方法：")
                        .font(.subheadline)
                    
                    Picker("解包方法", selection: $selectedMethod) {
                        ForEach(unwrappingMethods, id: \.self) { method in
                            Text(method).tag(method)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // 方法对比结果
                VStack(spacing: 12) {
                    // 安全性评级
                    HStack {
                        Text("安全性：")
                            .font(.subheadline)
                        Spacer()
                        Text(methodResult.safety)
                            .fontWeight(.semibold)
                            .foregroundColor(methodResult.color)
                    }
                    
                    // 执行结果
                    VStack(alignment: .leading, spacing: 4) {
                        Text("执行结果：")
                            .font(.subheadline)
                        
                        Text(methodResult.result)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(methodResult.color)
                            .padding()
                            .background(methodResult.color.opacity(0.1))
                            .cornerRadius(6)
                    }
                    
                    // 代码示例
                    VStack(alignment: .leading, spacing: 4) {
                        Text("代码示例：")
                            .font(.subheadline)
                        
                        Text(methodResult.code)
                            .font(.system(.caption, design: .monospaced))
                            .foregroundColor(.secondary)
                            .padding()
                            .background(Color.green.opacity(0.05))
                            .cornerRadius(6)
                    }
                }
                
                // 最佳实践建议
                VStack(alignment: .leading, spacing: 4) {
                    Text("💡 最佳实践：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    switch selectedMethod {
                    case "可选绑定":
                        Text("推荐使用！安全且灵活，可以处理nil情况")
                    case "nil合并":
                        Text("适合有合理默认值的场景")
                    case "强制解包":
                        Text("尽量避免！只在确定不为nil时使用")
                    case "可选链":
                        Text("适合链式调用，返回可选值")
                    default:
                        Text("")
                    }
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - 错误处理模拟器
struct ErrorHandlingSimulatorCard: View {
    @State private var selectedOperation = "密码验证"
    @State private var inputValue = "abc123"
    @State private var simulateError = false
    
    let operations = ["密码验证", "数字转换", "文件读取", "网络请求"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🚨 错误处理模拟器")
                .font(.headline)
                .foregroundColor(.red)
            
            VStack(spacing: 16) {
                // 操作选择
                VStack(alignment: .leading, spacing: 8) {
                    Text("选择操作类型：")
                        .font(.subheadline)
                    
                    Picker("操作", selection: $selectedOperation) {
                        ForEach(operations, id: \.self) { operation in
                            Text(operation).tag(operation)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // 输入参数
                VStack(spacing: 8) {
                    HStack {
                        Text("输入值：")
                        TextField(getPlaceholder(), text: $inputValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Toggle("模拟错误情况", isOn: $simulateError)
                }
                
                // 执行结果
                VStack(alignment: .leading, spacing: 8) {
                    Text("执行结果：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    let result = executeOperation()
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: result.success ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(result.success ? .green : .red)
                            
                            Text(result.success ? "执行成功" : "捕获错误")
                                .fontWeight(.semibold)
                                .foregroundColor(result.success ? .green : .red)
                        }
                        
                        Text(result.message)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(result.success ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                    .cornerRadius(8)
                }
                
                // do-catch代码示例
                VStack(alignment: .leading, spacing: 4) {
                    Text("对应的do-catch代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(getErrorHandlingCode())
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.red.opacity(0.05))
                        .cornerRadius(6)
                }
                
                // 错误类型说明
                VStack(alignment: .leading, spacing: 4) {
                    Text("可能的错误类型：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    ForEach(getPossibleErrors(), id: \.self) { error in
                        Text("• \(error)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding()
        .background(Color.red.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func getPlaceholder() -> String {
        switch selectedOperation {
        case "密码验证": return "输入密码"
        case "数字转换": return "输入文本"
        case "文件读取": return "文件名"
        case "网络请求": return "URL地址"
        default: return "输入值"
        }
    }
    
    private func executeOperation() -> (success: Bool, message: String) {
        if simulateError {
            switch selectedOperation {
            case "密码验证":
                return (false, "ValidationError.tooShort: 密码长度不足")
            case "数字转换":
                return (false, "ConversionError.invalidFormat: 无法转换为数字")
            case "文件读取":
                return (false, "FileError.notFound: 文件不存在")
            case "网络请求":
                return (false, "NetworkError.connectionFailed: 网络连接失败")
            default:
                return (false, "未知错误")
            }
        } else {
            switch selectedOperation {
            case "密码验证":
                return (true, "密码验证通过，符合安全要求")
            case "数字转换":
                if let _ = Double(inputValue) {
                    return (true, "成功转换为数字: \(inputValue)")
                } else {
                    return (false, "ConversionError.invalidFormat: 无法转换为数字")
                }
            case "文件读取":
                return (true, "文件读取成功: \(inputValue)")
            case "网络请求":
                return (true, "网络请求成功，返回数据")
            default:
                return (true, "操作成功")
            }
        }
    }
    
    private func getErrorHandlingCode() -> String {
        switch selectedOperation {
        case "密码验证":
            return """
            do {
                try validatePassword("\(inputValue)")
                print("密码验证通过")
            } catch ValidationError.tooShort {
                print("密码太短")
            } catch ValidationError.tooWeak {
                print("密码强度不够")
            } catch {
                print("其他错误: \\(error)")
            }
            """
        case "数字转换":
            return """
            do {
                let number = try convertToNumber("\(inputValue)")
                print("转换成功: \\(number)")
            } catch ConversionError.invalidFormat {
                print("格式无效")
            } catch {
                print("转换失败: \\(error)")
            }
            """
        case "文件读取":
            return """
            do {
                let content = try readFile("\(inputValue)")
                print("文件内容: \\(content)")
            } catch FileError.notFound {
                print("文件不存在")
            } catch FileError.permissionDenied {
                print("权限不足")
            } catch {
                print("读取失败: \\(error)")
            }
            """
        case "网络请求":
            return """
            do {
                let data = try fetchData("\(inputValue)")
                print("请求成功: \\(data)")
            } catch NetworkError.connectionFailed {
                print("网络连接失败")
            } catch NetworkError.timeout {
                print("请求超时")
            } catch {
                print("网络错误: \\(error)")
            }
            """
        default:
            return ""
        }
    }
    
    private func getPossibleErrors() -> [String] {
        switch selectedOperation {
        case "密码验证":
            return ["tooShort - 密码太短", "tooWeak - 密码强度不够", "invalidCharacters - 包含无效字符"]
        case "数字转换":
            return ["invalidFormat - 格式无效", "overflow - 数值溢出", "underflow - 数值下溢"]
        case "文件读取":
            return ["notFound - 文件不存在", "permissionDenied - 权限不足", "corrupted - 文件损坏"]
        case "网络请求":
            return ["connectionFailed - 连接失败", "timeout - 请求超时", "serverError - 服务器错误"]
        default:
            return []
        }
    }
}

// MARK: - Result类型练习器
struct ResultTypePracticeCard: View {
    @State private var selectedOperation = "除法运算"
    @State private var firstNumber = "10"
    @State private var secondNumber = "2"
    @State private var forceError = false
    
    let operations = ["除法运算", "数据验证", "API调用", "文件处理"]
    
    var calculationResult: Result<Double, CalculationError> {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return .failure(.invalidInput)
        }
        
        if forceError || second == 0 {
            return .failure(.divisionByZero)
        }
        
        return .success(first / second)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📦 Result类型练习器")
                .font(.headline)
                .foregroundColor(.indigo)
            
            VStack(spacing: 16) {
                // 操作选择
                VStack(alignment: .leading, spacing: 8) {
                    Text("操作类型：")
                        .font(.subheadline)
                    
                    Picker("操作", selection: $selectedOperation) {
                        ForEach(operations, id: \.self) { operation in
                            Text(operation).tag(operation)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // 输入参数
                if selectedOperation == "除法运算" {
                    VStack(spacing: 8) {
                        HStack {
                            Text("被除数：")
                            TextField("输入数字", text: $firstNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                        }
                        
                        HStack {
                            Text("除数：")
                            TextField("输入数字", text: $secondNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                        }
                        
                        Toggle("强制触发错误", isOn: $forceError)
                    }
                }
                
                // Result处理结果
                VStack(alignment: .leading, spacing: 8) {
                    Text("Result处理：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        // switch方式处理
                        VStack(alignment: .leading, spacing: 4) {
                            Text("使用switch处理：")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            let switchResult = handleWithSwitch()
                            Text(switchResult.message)
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(switchResult.isSuccess ? .green : .red)
                                .padding()
                                .background(switchResult.isSuccess ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                                .cornerRadius(6)
                        }
                        
                        // map方式处理
                        VStack(alignment: .leading, spacing: 4) {
                            Text("使用map变换：")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            let mapResult = calculationResult.map { "结果的两倍: \($0 * 2)" }
                            switch mapResult {
                            case .success(let message):
                                Text(message)
                                    .font(.system(.body, design: .monospaced))
                                    .foregroundColor(.blue)
                            case .failure(let error):
                                Text("变换失败: \(error.localizedDescription)")
                                    .font(.system(.body, design: .monospaced))
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(6)
                    }
                }
                
                // Result代码示例
                VStack(alignment: .leading, spacing: 4) {
                    Text("Result处理代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(getResultCode())
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.indigo.opacity(0.05))
                        .cornerRadius(6)
                }
                
                // Result优势说明
                VStack(alignment: .leading, spacing: 4) {
                    Text("💡 Result类型优势：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("• 可以存储和传递错误信息")
                        Text("• 支持函数式编程风格")
                        Text("• 适合异步操作")
                        Text("• 类型安全的错误处理")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color.indigo.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func handleWithSwitch() -> (message: String, isSuccess: Bool) {
        switch calculationResult {
        case .success(let value):
            return ("✅ 计算成功: \(String(format: "%.2f", value))", true)
        case .failure(let error):
            return ("❌ 计算失败: \(error.localizedDescription)", false)
        }
    }
    
    private func getResultCode() -> String {
        return """
        enum CalculationError: Error {
            case divisionByZero
            case invalidInput
        }

        func divide(_ a: Double, by b: Double) -> Result<Double, CalculationError> {
            guard b != 0 else {
                return .failure(.divisionByZero)
            }
            return .success(a / b)
        }

        // 使用Result
        let result = divide(\(firstNumber), by: \(secondNumber))
        switch result {
        case .success(let value):
            print("结果: \\(value)")
        case .failure(let error):
            print("错误: \\(error)")
        }
        """
    }
}

enum CalculationError: Error {
    case divisionByZero
    case invalidInput
    
    var localizedDescription: String {
        switch self {
        case .divisionByZero:
            return "除数不能为零"
        case .invalidInput:
            return "输入格式无效"
        }
    }
}

// MARK: - Day 4 综合练习组件

// MARK: - 用户注册表单验证器
struct UserRegistrationFormCard: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var age = ""
    
    var validationResults: [FieldValidation] {
        var results: [FieldValidation] = []
        
        // 用户名验证
        results.append(validateUsername(username))
        
        // 邮箱验证
        results.append(validateEmail(email))
        
        // 密码验证
        results.append(validatePassword(password))
        
        // 确认密码验证
        results.append(validateConfirmPassword(confirmPassword, original: password))
        
        // 年龄验证
        results.append(validateAge(age))
        
        return results
    }
    
    var canRegister: Bool {
        return validationResults.allSatisfy { $0.isValid }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📝 用户注册表单验证器")
                .font(.headline)
                .foregroundColor(.purple)
            
            VStack(spacing: 16) {
                // 注册表单
                VStack(spacing: 12) {
                    HStack {
                        Text("用户名")
                            .frame(width: 70, alignment: .leading)
                        TextField("输入用户名", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("邮箱")
                            .frame(width: 70, alignment: .leading)
                        TextField("输入邮箱地址", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    }
                    
                    HStack {
                        Text("密码")
                            .frame(width: 70, alignment: .leading)
                        SecureField("输入密码", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("确认密码")
                            .frame(width: 70, alignment: .leading)
                        SecureField("再次输入密码", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("年龄")
                            .frame(width: 70, alignment: .leading)
                        TextField("输入年龄", text: $age)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                }
                
                // 验证结果
                VStack(alignment: .leading, spacing: 8) {
                    Text("字段验证结果：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    ForEach(validationResults, id: \.fieldName) { validation in
                        HStack {
                            Image(systemName: validation.isValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(validation.isValid ? .green : .red)
                            
                            VStack(alignment: .leading) {
                                Text(validation.fieldName)
                                    .font(.body)
                                    .fontWeight(.medium)
                                
                                Text(validation.message)
                                    .font(.caption)
                                    .foregroundColor(validation.isValid ? .green : .red)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(Color.purple.opacity(0.1))
                .cornerRadius(8)
                
                // 注册按钮
                Button(action: {
                    // 模拟注册操作
                }) {
                    HStack {
                        Image(systemName: "person.badge.plus")
                        Text("注册账户")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(canRegister ? Color.purple : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .disabled(!canRegister)
                
                if canRegister {
                    Text("✅ 所有字段验证通过，可以注册")
                        .font(.caption)
                        .foregroundColor(.green)
                } else {
                    let invalidCount = validationResults.filter { !$0.isValid }.count
                    Text("❌ 还有\(invalidCount)个字段需要修正")
                        .font(.caption)
                        .foregroundColor(.red)
                }
                
                // 验证代码示例
                VStack(alignment: .leading, spacing: 4) {
                    Text("guard let验证示例：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("""
                    func validateRegistration() throws -> User {
                        guard !username.isEmpty else {
                            throw ValidationError.emptyUsername
                        }
                        
                        guard email.contains("@") else {
                            throw ValidationError.invalidEmail
                        }
                        
                        guard password.count >= 6 else {
                            throw ValidationError.weakPassword
                        }
                        
                        return User(username: username, email: email)
                    }
                    """)
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.purple.opacity(0.05))
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.purple.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func validateUsername(_ username: String) -> FieldValidation {
        if username.isEmpty {
            return FieldValidation(fieldName: "用户名", isValid: false, message: "用户名不能为空")
        }
        if username.count < 3 {
            return FieldValidation(fieldName: "用户名", isValid: false, message: "用户名至少3个字符")
        }
        return FieldValidation(fieldName: "用户名", isValid: true, message: "用户名格式正确")
    }
    
    private func validateEmail(_ email: String) -> FieldValidation {
        if email.isEmpty {
            return FieldValidation(fieldName: "邮箱", isValid: false, message: "邮箱不能为空")
        }
        if !email.contains("@") || !email.contains(".") {
            return FieldValidation(fieldName: "邮箱", isValid: false, message: "邮箱格式不正确")
        }
        return FieldValidation(fieldName: "邮箱", isValid: true, message: "邮箱格式正确")
    }
    
    private func validatePassword(_ password: String) -> FieldValidation {
        if password.isEmpty {
            return FieldValidation(fieldName: "密码", isValid: false, message: "密码不能为空")
        }
        if password.count < 6 {
            return FieldValidation(fieldName: "密码", isValid: false, message: "密码至少6位")
        }
        return FieldValidation(fieldName: "密码", isValid: true, message: "密码强度合格")
    }
    
    private func validateConfirmPassword(_ confirmPassword: String, original: String) -> FieldValidation {
        if confirmPassword.isEmpty {
            return FieldValidation(fieldName: "确认密码", isValid: false, message: "请再次输入密码")
        }
        if confirmPassword != original {
            return FieldValidation(fieldName: "确认密码", isValid: false, message: "两次密码不一致")
        }
        return FieldValidation(fieldName: "确认密码", isValid: true, message: "密码确认正确")
    }
    
    private func validateAge(_ age: String) -> FieldValidation {
        if age.isEmpty {
            return FieldValidation(fieldName: "年龄", isValid: false, message: "年龄不能为空")
        }
        guard let ageValue = Int(age), ageValue >= 18 && ageValue <= 100 else {
            return FieldValidation(fieldName: "年龄", isValid: false, message: "年龄必须在18-100之间")
        }
        return FieldValidation(fieldName: "年龄", isValid: true, message: "年龄有效")
    }
}

struct FieldValidation {
    let fieldName: String
    let isValid: Bool
    let message: String
}

// MARK: - 数据转换管道
struct DataTransformationPipelineCard: View {
    @State private var inputData = "1,2,3,abc,5,6,xyz,8,9,10"
    @State private var showSteps = true
    
    var transformationSteps: [(step: String, input: String, output: String, success: Bool)] {
        var steps: [(String, String, String, Bool)] = []
        
        // 步骤1: 分割字符串
        let components = inputData.components(separatedBy: ",")
        steps.append(("1. 字符串分割", inputData, components.joined(separator: " | "), true))
        
        // 步骤2: 尝试转换为数字
        let numbers = components.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        let conversionSuccess = numbers.count == components.count
        steps.append(("2. 数字转换", components.joined(separator: ", "), numbers.map(String.init).joined(separator: ", "), conversionSuccess))
        
        // 步骤3: 过滤有效数字
        let validNumbers = numbers.filter { $0 > 0 }
        steps.append(("3. 正数过滤", numbers.map(String.init).joined(separator: ", "), validNumbers.map(String.init).joined(separator: ", "), true))
        
        // 步骤4: 计算统计信息
        if !validNumbers.isEmpty {
            let sum = validNumbers.reduce(0, +)
            let avg = Double(sum) / Double(validNumbers.count)
            steps.append(("4. 统计计算", validNumbers.map(String.init).joined(separator: ", "), "总和: \(sum), 平均: \(String(format: "%.1f", avg))", true))
        } else {
            steps.append(("4. 统计计算", "无有效数据", "无法计算", false))
        }
        
        return steps
    }
    
    var finalResult: Result<DataSummary, DataError> {
        let components = inputData.components(separatedBy: ",")
        
        guard !components.isEmpty else {
            return .failure(.emptyInput)
        }
        
        let numbers = components.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        
        guard !numbers.isEmpty else {
            return .failure(.noValidNumbers)
        }
        
        let validNumbers = numbers.filter { $0 > 0 }
        
        guard !validNumbers.isEmpty else {
            return .failure(.noPositiveNumbers)
        }
        
        let sum = validNumbers.reduce(0, +)
        let average = Double(sum) / Double(validNumbers.count)
        let max = validNumbers.max() ?? 0
        let min = validNumbers.min() ?? 0
        
        return .success(DataSummary(
            count: validNumbers.count,
            sum: sum,
            average: average,
            max: max,
            min: min,
            validNumbers: validNumbers
        ))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🔄 数据转换管道")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(spacing: 16) {
                // 输入数据
                VStack(alignment: .leading, spacing: 8) {
                    Text("输入数据（逗号分隔）：")
                        .font(.subheadline)
                    
                    TextField("输入数据", text: $inputData)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Toggle("显示处理步骤", isOn: $showSteps)
                
                // 处理步骤
                if showSteps {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("处理步骤：")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(transformationSteps.enumerated()), id: \.offset) { index, step in
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Image(systemName: step.success ? "checkmark.circle.fill" : "xmark.circle.fill")
                                        .foregroundColor(step.success ? .green : .red)
                                    
                                    Text(step.step)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                }
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("输入: \(step.input)")
                                        .font(.system(.caption, design: .monospaced))
                                        .foregroundColor(.secondary)
                                    
                                    Text("输出: \(step.output)")
                                        .font(.system(.caption, design: .monospaced))
                                        .foregroundColor(step.success ? .primary : .red)
                                }
                            }
                            .padding()
                            .background(step.success ? Color.green.opacity(0.05) : Color.red.opacity(0.05))
                            .cornerRadius(6)
                        }
                    }
                }
                
                // 最终结果
                VStack(alignment: .leading, spacing: 8) {
                    Text("最终结果：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    switch finalResult {
                    case .success(let summary):
                        VStack(alignment: .leading, spacing: 4) {
                            Text("✅ 处理成功")
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("有效数字: \(summary.validNumbers.map(String.init).joined(separator: ", "))")
                                Text("总计: \(summary.count) 个数字")
                                Text("总和: \(summary.sum)")
                                Text("平均值: \(String(format: "%.2f", summary.average))")
                                Text("最大值: \(summary.max)")
                                Text("最小值: \(summary.min)")
                            }
                            .font(.caption)
                        }
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        
                    case .failure(let error):
                        VStack(alignment: .leading, spacing: 4) {
                            Text("❌ 处理失败")
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                            
                            Text(error.localizedDescription)
                                .font(.body)
                        }
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                
                // Result管道代码示例
                VStack(alignment: .leading, spacing: 4) {
                    Text("Result管道处理代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("""
                    func processData(_ input: String) -> Result<DataSummary, DataError> {
                        // 链式处理，任何步骤失败都会返回错误
                        return parseInput(input)
                            .flatMap(convertToNumbers)
                            .flatMap(filterPositive)
                            .map(calculateStatistics)
                    }
                    """)
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
}

struct DataSummary {
    let count: Int
    let sum: Int
    let average: Double
    let max: Int
    let min: Int
    let validNumbers: [Int]
}

enum DataError: Error {
    case emptyInput
    case noValidNumbers
    case noPositiveNumbers
    
    var localizedDescription: String {
        switch self {
        case .emptyInput:
            return "输入为空"
        case .noValidNumbers:
            return "没有有效的数字"
        case .noPositiveNumbers:
            return "没有正数"
        }
    }
}

// MARK: - 文件操作模拟器
struct FileOperationSimulatorCard: View {
    @State private var fileName = "data.txt"
    @State private var selectedOperation = "读取文件"
    @State private var simulateSuccess = true
    
    let operations = ["读取文件", "写入文件", "删除文件", "创建目录"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📁 文件操作模拟器")
                .font(.headline)
                .foregroundColor(.green)
            
            VStack(spacing: 16) {
                // 操作配置
                VStack(spacing: 8) {
                    HStack {
                        Text("文件名：")
                        TextField("输入文件名", text: $fileName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("操作类型：")
                            .font(.subheadline)
                        
                        Picker("操作", selection: $selectedOperation) {
                            ForEach(operations, id: \.self) { operation in
                                Text(operation).tag(operation)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Toggle("模拟成功操作", isOn: $simulateSuccess)
                }
                
                // 执行结果
                VStack(alignment: .leading, spacing: 8) {
                    Text("执行结果：")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    let result = simulateFileOperation()
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: result.success ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(result.success ? .green : .red)
                            
                            Text(result.success ? "操作成功" : "操作失败")
                                .fontWeight(.semibold)
                                .foregroundColor(result.success ? .green : .red)
                        }
                        
                        Text(result.message)
                            .font(.body)
                    }
                    .padding()
                    .background(result.success ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                    .cornerRadius(8)
                }
                
                // defer语句示例
                VStack(alignment: .leading, spacing: 4) {
                    Text("带defer的文件操作代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(getDeferCode())
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.green.opacity(0.05))
                        .cornerRadius(6)
                }
                
                // 错误处理说明
                VStack(alignment: .leading, spacing: 4) {
                    Text("💡 文件操作最佳实践：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("• 始终使用do-catch处理文件操作错误")
                        Text("• 使用defer确保资源正确释放")
                        Text("• 检查文件权限和存在性")
                        Text("• 处理磁盘空间不足等系统错误")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func simulateFileOperation() -> (success: Bool, message: String) {
        if simulateSuccess {
            switch selectedOperation {
            case "读取文件":
                return (true, "成功读取文件 '\(fileName)'，内容: Hello, Swift!")
            case "写入文件":
                return (true, "成功写入文件 '\(fileName)'，写入了25字节")
            case "删除文件":
                return (true, "成功删除文件 '\(fileName)'")
            case "创建目录":
                return (true, "成功创建目录 '\(fileName)'")
            default:
                return (true, "操作完成")
            }
        } else {
            switch selectedOperation {
            case "读取文件":
                return (false, "FileError.notFound: 文件 '\(fileName)' 不存在")
            case "写入文件":
                return (false, "FileError.permissionDenied: 没有写入权限")
            case "删除文件":
                return (false, "FileError.notFound: 文件 '\(fileName)' 不存在")
            case "创建目录":
                return (false, "FileError.alreadyExists: 目录已存在")
            default:
                return (false, "操作失败")
            }
        }
    }
    
    private func getDeferCode() -> String {
        return """
        func \(selectedOperation.lowercased())File(_ filename: String) throws -> String {
            print("开始\(selectedOperation): \\(filename)")
            
            // defer确保清理工作总是执行
            defer {
                print("清理资源和临时文件")
                print("\(selectedOperation)操作结束")
            }
            
            // 模拟文件操作
            guard simulateSuccess else {
                throw FileError.operationFailed
            }
            
            return "操作成功"
        }
        """
    }
}

// MARK: - API调用模拟器
struct APICallSimulatorCard: View {
    @State private var apiEndpoint = "/api/users"
    @State private var requestType = "GET"
    @State private var simulateSuccess = true
    @State private var responseDelay = 1.0
    @State private var isLoading = false
    
    let requestTypes = ["GET", "POST", "PUT", "DELETE"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🌐 API调用模拟器")
                .font(.headline)
                .foregroundColor(.indigo)
            
            VStack(spacing: 16) {
                // API配置
                VStack(spacing: 8) {
                    HStack {
                        Text("API端点：")
                        TextField("输入API端点", text: $apiEndpoint)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("请求类型：")
                            .font(.subheadline)
                        
                        Picker("请求类型", selection: $requestType) {
                            ForEach(requestTypes, id: \.self) { type in
                                Text(type).tag(type)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    HStack {
                        Text("响应延迟：")
                        Slider(value: $responseDelay, in: 0.5...5.0, step: 0.5)
                        Text("\(String(format: "%.1f", responseDelay))s")
                            .frame(width: 40)
                    }
                    
                    Toggle("模拟成功响应", isOn: $simulateSuccess)
                }
                
                // API调用按钮
                Button(action: {
                    performAPICall()
                }) {
                    HStack {
                        if isLoading {
                            ProgressView()
                                .scaleEffect(0.8)
                        } else {
                            Image(systemName: "network")
                        }
                        Text(isLoading ? "请求中..." : "发送API请求")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isLoading ? Color.gray : Color.indigo)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .disabled(isLoading)
                
                // Result类型的异步处理示例
                VStack(alignment: .leading, spacing: 4) {
                    Text("Result异步处理代码：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("""
                    func fetchUserData(completion: @escaping (Result<User, APIError>) -> Void) {
                        // 模拟网络延迟
                        DispatchQueue.global().asyncAfter(deadline: .now() + \(String(format: "%.1f", responseDelay))) {
                            if simulateSuccess {
                                let user = User(id: 1, name: "用户")
                                completion(.success(user))
                            } else {
                                completion(.failure(.networkError))
                            }
                        }
                    }
                    
                    // 使用API
                    fetchUserData { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let user):
                                print("获取用户成功: \\(user)")
                            case .failure(let error):
                                print("API调用失败: \\(error)")
                            }
                        }
                    }
                    """)
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color.indigo.opacity(0.05))
                        .cornerRadius(6)
                }
                
                // 错误处理类型
                VStack(alignment: .leading, spacing: 4) {
                    Text("常见API错误类型：")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("• networkError - 网络连接失败")
                        Text("• timeout - 请求超时")
                        Text("• unauthorized - 未授权访问")
                        Text("• serverError - 服务器内部错误")
                        Text("• invalidResponse - 响应格式错误")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color.indigo.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func performAPICall() {
        isLoading = true
        
        // 模拟异步API调用
        DispatchQueue.main.asyncAfter(deadline: .now() + responseDelay) {
            isLoading = false
            // 这里可以显示实际的API调用结果
        }
    }
}

// MARK: - 预览
struct InteractiveComponents_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Day1 组件
                InteractiveConverterCard()
                InteractiveStringCard(name: .constant("Swift学习者"), age: .constant(20))
                BMICalculatorCard()
                PersonalInfoCard()
                TemperatureConverterCard()
                
                // Day2 组件
                InteractiveClosureCard()
                ArrayOperationsCard()
                CollectionComparisonCard()
                StudentGradeManagerCard()
                ArrayOperationPracticeCard()
                ShoppingListManagerCard()
                
                // Day3 组件
                TemperatureJudgeCard()
                GradeEvaluatorCard()
                NumberSequenceCard()
                CountdownTimerCard()
                NumberGuessGameCard()
                GradeStatisticsCard()
                PasswordValidatorCard()
                FizzBuzzGameCard()
                
                // Day4 组件
                OptionalExplorerCard()
                OptionalBindingPracticeCard()
                SafeUnwrappingComparisonCard()
                ErrorHandlingSimulatorCard()
                ResultTypePracticeCard()
                UserRegistrationFormCard()
                DataTransformationPipelineCard()
                FileOperationSimulatorCard()
                APICallSimulatorCard()
            }
            .padding()
        }
    }
}