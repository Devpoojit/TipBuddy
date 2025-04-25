import SwiftUI

struct ContentView: View {
    @State private var moveToTop = false
    @State private var billAmount: Double = 1200
    @State private var selectedTip: Int? = nil
    @State private var customTip: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    let tipOptions = [15, 20, 25]
    
    // Calculate tip percentage
    private var tipPercentage: Double {
        if let selectedTip = selectedTip {
            return Double(selectedTip)
        } else if let customValue = Double(customTip), customValue >= 0 {
            return customValue
        }
        return 0
    }
    
    // Calculate tip amount
    private var tipAmount: Double {
        return billAmount * tipPercentage / 100
    }
    
    // Calculate total amount
    private var totalAmount: Double {
        return billAmount + tipAmount
    }
    
    private var accentColor: Color {
        Color.blue.opacity(0.8)
    }
    
    private var cardBackgroundColor: Color {
        colorScheme == .dark ? Color(UIColor.systemGray6) : Color.white
    }
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                // Title
                Text("Tip Calculator")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(accentColor)
                    .offset(y: moveToTop ? 0 : 0)
                    .animation(.easeInOut(duration: 0.8), value: moveToTop)
                
                // Main card
                VStack(spacing: 25) {
                    // Bill amount
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bill Amount")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Text("₹")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(accentColor)
                            
                            TextField("0", value: $billAmount, format: .number)
                                .keyboardType(.decimalPad)
                                .font(.system(size: 34, weight: .medium))
                                .foregroundColor(.primary)
                                .minimumScaleFactor(0.5)
                        }
                        .padding(.vertical, 5)
                        
                        Divider()
                    }
                    .padding(.horizontal)
                    
                    // Tip Selection
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Tip Percentage")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        // Tip buttons
                        HStack(spacing: 12) {
                            ForEach(tipOptions, id: \.self) { tip in
                                Button {
                                    withAnimation(.spring()) {
                                        selectedTip = tip
                                        customTip = ""
                                        hideKeyboard()
                                    }
                                } label: {
                                    Text("\(tip)%")
                                        .font(.system(size: 18, weight: .medium, design: .rounded))
                                        .foregroundColor(selectedTip == tip ? .white : .primary)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 56)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .fill(selectedTip == tip ? accentColor : Color.gray.opacity(0.15))
                                        )
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Custom tip
                        HStack {
                            Text("Custom")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(.primary)
                                .frame(width: 70, alignment: .leading)
                            
                            TextField("Other %", text: $customTip)
                                .keyboardType(.decimalPad)
                                .font(.system(size: 16, weight: .medium))
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 12)
                                .background(Color.gray.opacity(0.12))
                                .cornerRadius(10)
                                .onChange(of: customTip) { newValue, oldValue in
                                    if !newValue.isEmpty {
                                        withAnimation(.spring()) {
                                            selectedTip = nil
                                        }
                                    }
                                }
                            
                            Text("%")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Results
                    VStack(spacing: 18) {
                        // Tip amount
                        HStack {
                            Text("Tip")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Text("₹\(tipAmount, specifier: "%.2f")")
                                .font(.system(size: 20, weight: .medium))
                        }
                        
                        // Total
                        HStack {
                            Text("Total")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("₹\(totalAmount, specifier: "%.2f")")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(accentColor)
                        }
                        
                        if tipPercentage > 0 {
                            // Percentage indicator
                            HStack {
                                Spacer()
                                Text("\(tipPercentage, specifier: "%.1f")% tip")
                                    .font(.system(size: 14, weight: .medium, design: .rounded))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        Capsule()
                                            .fill(accentColor.opacity(0.15))
                                    )
                                    .foregroundColor(accentColor)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .padding(.vertical, 30)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(cardBackgroundColor)
                        .shadow(color: Color.black.opacity(0.08), radius: 20, x: 0, y: 5)
                )
                .padding(.horizontal)
                
                // Per person split (visual element only)
                if tipPercentage > 0 {
                    Button {
                        // This would open a split feature in a full app
                    } label: {
                        HStack {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 16))
                            Text("Split the bill")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                        }
                        .foregroundColor(accentColor)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(accentColor.opacity(0.3), lineWidth: 1)
                        )
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
            }
            .padding(.top, 50)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                moveToTop = true
            }
        }
    }
}

// Extension to hide keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
