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

// MARK: - 预览
struct InteractiveComponents_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
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
            }
            .padding()
        }
    }
}