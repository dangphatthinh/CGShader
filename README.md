# 🎮 Unity Shader Showcase

A collection of custom shaders and visual effects built in Unity, demonstrating various rendering techniques.

---

## 📸 Preview

### 🔷 Stencil Buffer
![Stencil](Assets/images/Image_Sequence_007_0000.jpg)
> Sử dụng Stencil Buffer để render các object bên trong một vùng không gian giới hạn (hộp kính), tạo hiệu ứng "nhìn xuyên" có kiểm soát.

---

### 🌊 Vertex Animation & Scroll Texture
![Vertex Anim & Scroll Texture](Assets/images/Image_Sequence_005_0000.jpg)
> Di chuyển vertex theo thời gian kết hợp với texture cuộn liên tục để tạo hiệu ứng mặt nước sống động.

---

### 💡 Lighting Models
![Lighting](Assets/images/Image_Sequence_006_0000.jpg)
> So sánh ba mô hình ánh sáng phổ biến:
> - **BlinnPhong Lighting** – Specular highlight mềm mại, phù hợp bề mặt bóng.
> - **Lambert Lighting** – Diffuse thuần túy, bề mặt mờ, tự nhiên.
> - **Toon Shading** – Đổ bóng phân bậc kiểu hoạt hình.

---

### 🌀 Rim (Fresnel)
![Rim Fresnel](Assets/images/Image_Sequence_001_0000.jpg)
> Hiệu ứng phát sáng viền dựa trên góc nhìn (Fresnel), tạo cảm giác phát quang từ rìa object khi nhìn từ phía trước.

---

### 📐 Extrude
![Extrude](Assets/images/Image_Sequence_002_0000.jpg)
> Đẩy các vertex dọc theo hướng normal trong vertex shader, tạo hiệu ứng phình to hoặc inflate toàn bộ mesh.

---

### ✏️ Outline
![Outline](Assets/images/Image_Sequence_003_0000.jpg)
> Kỹ thuật vẽ viền bằng cách render một pass thứ hai với mesh phóng to và flip normal, tạo đường viền rõ nét xung quanh object.

---

### 👻 Hologram
![Hologram](Assets/images/Image_Sequence_004_0000.jpg)
> Kết hợp wireframe, scanline và Fresnel để tạo hiệu ứng hologram sci-fi trong suốt.

---

## 🛠️ Công nghệ sử dụng

- **Engine**: Unity (Built-in)
- **Ngôn ngữ Shader**: CG / ShaderLab
- **Scripting**: C#

