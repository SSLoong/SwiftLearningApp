// ContentView.swift
// Swift 学习应用的主界面

import SwiftUI

struct ContentView: View {
    @State private var selectedDay = 1
    @State private var showingLearningDetail = false
    @State private var showingDay2Detail = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // 应用标题
                HStack {
                    Image(systemName: "swift")
                        .foregroundColor(.orange)
                        .font(.title)
                    Text("Swift 学习之旅")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(.top)
                
                // 学习进度指示器
                VStack(spacing: 10) {
                    ProgressView(value: Double(selectedDay), total: 21.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                    
                    Text("学习进度：Day \(selectedDay) / 21")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Day 1 学习卡片
                DayLearningCard(
                    day: 1,
                    title: "Swift 基础语法",
                    description: "变量、常量、数据类型和字符串插值",
                    topics: ["变量 vs 常量", "基本数据类型", "类型转换", "字符串插值"],
                    isCompleted: false,
                    action: {
                        selectedDay = 1
                        showingLearningDetail = true
                    }
                )
                
                // Day 2 学习卡片
                DayLearningCard(
                    day: 2,
                    title: "函数与集合",
                    description: "函数定义、闭包语法和集合类型",
                    topics: ["函数基础", "闭包语法", "Array数组", "Dictionary字典"],
                    isCompleted: false,
                    action: {
                        selectedDay = 2
                        showingDay2Detail = true
                    }
                )
                
                // 即将推出的课程
                ComingSoonCard()
                
                Spacer()
                
                // 开始学习按钮
                Button(action: {
                    if selectedDay == 1 {
                        showingLearningDetail = true
                    } else if selectedDay == 2 {
                        showingDay2Detail = true
                    }
                }) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                        Text("开始 Day \(selectedDay) 学习")
                    }
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingLearningDetail) {
            Day1LearningView()
        }
        .sheet(isPresented: $showingDay2Detail) {
            Day2LearningView()
        }
    }
}

// MARK: - Day 学习卡片组件
struct DayLearningCard: View {
    let day: Int
    let title: String
    let description: String
    let topics: [String]
    let isCompleted: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                // 卡片头部
                HStack {
                    VStack(alignment: .leading) {
                        Text("Day \(day)")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Text(title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.title2)
                    } else {
                        Image(systemName: "play.circle")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                }
                
                // 描述
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                // 学习要点
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), alignment: .leading, spacing: 8) {
                    ForEach(topics, id: \.self) { topic in
                        HStack {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                                .font(.caption)
                            Text(topic)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue.opacity(0.05))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue.opacity(0.2), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
    }
}

// MARK: - 即将推出卡片
struct ComingSoonCard: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "clock")
                .font(.largeTitle)
                .foregroundColor(.orange)
            
            Text("更多课程即将推出")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Day 3-21 正在开发中\n敬请期待！")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.orange.opacity(0.05))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.orange.opacity(0.2), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

// MARK: - 预览
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}