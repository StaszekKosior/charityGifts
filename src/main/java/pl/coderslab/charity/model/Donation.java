package pl.coderslab.charity.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "donations")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Min(1)
    @NotNull(message = "{donation.quantity.format.error}")
    private Integer quantity;

    @ManyToMany
    @NotEmpty(message = "{donation.categories.format.error}")
    private List<Category> categories = new ArrayList<>();

    @OneToOne
    @NotNull(message = "{donation.institution.format.error}")
    private Institution institution;

    @NotBlank
    private String street;

    @NotBlank
    private String city;

    @NotNull
    @Size(min = 9, max = 9, message = "{phone.number.format.error}")
    private String phoneNumber;

    @NotNull
    @Size(min = 6, max = 6, message = "{donation.zipCode.format.error}")
    private String zipCode;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    @NotNull
    private LocalTime pickUpTime;

    private String pickUpComment;
}
