package iuh.fit.se.bai2.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Entity
@Table(name = "dien_thoai")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DienThoai {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maDT;

    @NotBlank(message = "Tên điện thoại không được để trống")
    private String tenDT;

    @NotNull(message = "Năm sản xuất không được để trống")
    @Min(value = 1000, message = "Năm sản xuất phải là 4 chữ số")
    private Integer namSX;

    @NotBlank(message = "Cấu hình không được để trống")
    @Size(max = 255, message = "Thông tin cấu hình không được quá 255 ký tự")
    private String cauHinh;

    @Pattern(regexp = ".*\\.(png|jpg|jpeg)$", message = "Hình ảnh chỉ chấp nhận định dạng: png, jpg, jpeg")
    private String hinhAnh;

    @DecimalMin(value = "0.0", inclusive = true, message = "Giá phải là số không âm")
    private Double gia;

    @ManyToOne
    @JoinColumn(name = "maNCC")
    @NotNull(message = "Nhà cung cấp không được để trống")
    private NhaCungCap nhaCungCap;
}
