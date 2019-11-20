package entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class Country {
    private int id;
    private String iscountry;
    private String isminority;
    private String bordercountry;
    private String supportunit;
    private int  nmzhs;
    private int nmzrk;
    private int xzgs;
    private int lastgdp;
    private int income;
    private String countryname;

}
