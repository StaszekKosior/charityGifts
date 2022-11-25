package pl.coderslab.charity.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
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
    private Integer quantity;

    @ManyToMany
    @NotNull
    private List<Category> categories = new ArrayList<>();

    @OneToOne
    @NotNull
    private Institution institution;

    @NotNull
    private String street;

    @NotNull
    private String city;

    @NotNull
    @Size(min = 9, max = 9)
    private String phoneNumber;

    @NotNull
    @Size(min = 6, max = 6)
    private String zipCode;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    @NotNull
    private LocalTime pickUpTime;

    private String pickUpComment;


}
