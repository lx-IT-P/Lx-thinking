package utils;
import entity.PkhInformation;
import entity.PkhInformation;
import javafx.collections.SetChangeListener;
import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.impl.PkuServiceDaoImpl;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class ImportExcelUtil {
    @Autowired
    private PkuServiceDaoImpl service;
    private final static String excel2003L =".xls";    //2003- 版本的excel
    private final static String excel2007U =".xlsx";   //2007+ 版本的excel

    /**
     * 描述：获取IO流中的数据，组装成List<List<Object>>对象
     * @param in,fileName
     * @return
     * @throws IOException
     */
    public  PkhInformation getBankListByExcel(InputStream in,String fileName) throws Exception{
        //List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
        //List<PkhInformation> list= new ArrayList<PkhInformation>();
        PkhInformation mu = new PkhInformation();
        //创建Excel工作薄
        Workbook work = this.getWorkbook(in,fileName);
        if(null == work){
            throw new Exception("创建Excel工作薄为空！");
        }
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;
        //遍历Excel中所有的sheet
        for (int i = 0; i < work.getNumberOfSheets(); i++) {
            sheet = work.getSheetAt(i);
            if(sheet==null){continue;}
            //遍历当前sheet中的所有行
            for (int j = sheet.getFirstRowNum()+1; j < sheet.getLastRowNum(); j++) {
                row = sheet.getRow(j);
                if(row==null||row.getFirstCellNum()==j){continue;}
                //遍历所有的列
                for (int y = row.getFirstCellNum(); y < row.getLastCellNum(); y++) {
                    cell = row.getCell(14);
                    String province =  row.getCell(0).getStringCellValue();
                    mu.setProvince(province);
                    String city =  row.getCell(1).getStringCellValue();
                    mu.setCity(city);
                    String village =  row.getCell(2).getStringCellValue();
                    mu.setVillage(village);
                    String name =  row.getCell(3).getStringCellValue();
                    mu.setName(name);
                    int code = (int) row.getCell(4).getNumericCellValue();
                    mu.setCode(code);
                    String country =  row.getCell(5).getStringCellValue();
                    mu.setCountry(country);
                    String time = row.getCell(6).getStringCellValue();
                    mu.setTime(time);
                    int rjcsh = (int) row.getCell(13).getNumericCellValue();
                    mu.setRjcsh(rjcsh);
                    int lxfs = (int) row.getCell(7).getNumericCellValue();
                    mu.setLxfs(lxfs);
                    String pkyy =  row.getCell(10).getStringCellValue();
                    mu.setPkyy(pkyy);
                    String bankname =  row.getCell(8).getStringCellValue();
                    mu.setBankname(bankname);
                    int banknumber = (int) row.getCell(9).getNumericCellValue();
                    mu.setBanknumber(banknumber);
                    int familynumber = (int) row.getCell(11).getNumericCellValue();
                    mu.setFamilynumber(familynumber);
                    String bfdw = row.getCell(14).getStringCellValue();
                    mu.setBfdw(bfdw);
                    int zfmj = (int) row.getCell(12).getNumericCellValue();
                    mu.setZfmj(zfmj);
                  //list.add(mu);
                }
            }
        }
        in.close();
return mu;
    }

    /**
     * 描述：根据文件后缀，自适应上传文件的版本
     * @param inStr,fileName
     * @return
     * @throws Exception
     */
    public  Workbook getWorkbook(InputStream inStr,String fileName) throws Exception{
        Workbook wb = null;
        String fileType = fileName.substring(fileName.lastIndexOf("."));
        if(excel2003L.equals(fileType)){
            wb = new HSSFWorkbook(inStr);  //2003-
        }else if(excel2007U.equals(fileType)){
            wb = new XSSFWorkbook(inStr);  //2007+
        }else{
            throw new Exception("解析的文件格式有误！");
        }
        return wb;
    }

    /**
     * 描述：对表格中数值进行格式化
     * @param cell
     * @return
     */
    public  Object getCellValue(Cell cell){
        Object value = null;
        DecimalFormat df = new DecimalFormat("0");  //格式化number String字符
        SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");  //日期格式化
        DecimalFormat df2 = new DecimalFormat("0.00");  //格式化数字

        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_STRING:
                value = cell.getRichStringCellValue().getString();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                if("General".equals(cell.getCellStyle().getDataFormatString())){
                    value = df.format(cell.getNumericCellValue());
                }else if("m/d/yy".equals(cell.getCellStyle().getDataFormatString())){
                    value = sdf.format(cell.getDateCellValue());
                }else{
                    value = df2.format(cell.getNumericCellValue());
                }
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                value = cell.getBooleanCellValue();
                break;
            case Cell.CELL_TYPE_BLANK:
                value = "";
                break;
            default:
                break;
        }
        return value;

    }
}
