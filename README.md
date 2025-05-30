# 🧮 Swift Calculator (계산기 - Swift 기초 과제)

이 프로젝트는 Swift로 작성된 **간단한 계산기**입니다.  
두 개의 숫자를 입력받아 사칙연산과 나머지 연산을 수행하며,  
객체지향 원칙에 따라 연산 기능들을 클래스로 분리해 구성했습니다.

---

## ✅ 기능 소개

- ✅ 덧셈 (`+`)
- ✅ 뺄셈 (`-`)
- ✅ 곱셈 (`*`)
- ✅ 나눗셈 (`/`) - 0으로 나눌 경우 `nil` 반환
- ✅ 나머지 (`%`) - 0으로 나눌 경우 `nil` 반환
- ✅ 전략 패턴(Strategy Pattern)을 기반으로 한 연산 클래스 구조화

---

## 📂 파일 구조

```plaintext
Calculator.swift
├─ Calculator         // 기본 연산 함수들 포함
├─ Operation (protocol)
├─ AddOperation       // +
├─ SubtractOperation  // -
├─ MultiplyOperation  // *
├─ DivideOperation    // /
