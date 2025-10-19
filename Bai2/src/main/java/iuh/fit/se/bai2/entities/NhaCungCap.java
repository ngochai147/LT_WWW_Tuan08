package iuh.fit.se.bai2.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "nha_cung_cap")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NhaCungCap {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maNCC;

    private String tenNCC;
    private String diaChi;
    private String soDienThoai;
}
