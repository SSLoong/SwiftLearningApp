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
            }
            .padding()
        }
    }
}