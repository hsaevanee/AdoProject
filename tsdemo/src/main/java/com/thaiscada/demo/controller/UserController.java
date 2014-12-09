package com.thaiscada.demo.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thaiscada.demo.model.ChartData;
import com.thaiscada.demo.model.TableData;
import com.thaiscada.demo.model.User;
import com.thaiscada.demo.model.XLSXSampleData;
import com.thaiscada.demo.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.debug("home");
		return "home";
		}
	@RequestMapping(value = "/user/list")
	public ModelAndView listOfUsers() {
		ModelAndView modelAndView = new ModelAndView("user_list");
		List<User> users = userService.getUsers();
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
	@RequestMapping(value = "/user/listXLSX")
	public ModelAndView listOfXLSData() {
		ModelAndView modelAndView = new ModelAndView("xlsx_list");
		List<XLSXSampleData> listXLSXSamepleData = new ArrayList<XLSXSampleData>(); // Data
		ArrayList<String> XLSXcolName = new ArrayList<String>(); // Column_Name
						
		try {
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\population_by_ward.xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(0);
			for (int i = 0; i < sheet.getLastRowNum(); i++) {
				Row row = sheet.getRow(i);
				XLSXSampleData eXLSXSampleData = new XLSXSampleData();
				if (i==1){
					for (int j = 0; j < row.getLastCellNum(); j++) {
						XLSXcolName.add(row.getCell(j).getStringCellValue());
						System.out.println("colName"+row.getCell(j).getStringCellValue());
					}					
				}else if (i > 1 && i < 14) {
						eXLSXSampleData.setWardCode(row.getCell(0)
								.getStringCellValue());
						eXLSXSampleData.setWardName(row.getCell(1)
								.getStringCellValue());
						eXLSXSampleData.setAllAges(row.getCell(2)
								.getNumericCellValue());
						eXLSXSampleData.setAge0to4(row.getCell(3)
								.getNumericCellValue());
						eXLSXSampleData.setAge5to9(row.getCell(4)
								.getNumericCellValue());
						eXLSXSampleData.setAge10to15(row.getCell(5)
								.getNumericCellValue());
						eXLSXSampleData.setAge16to19(row.getCell(6)
								.getNumericCellValue());
						eXLSXSampleData.setAge20to24(row.getCell(7)
								.getNumericCellValue());
						eXLSXSampleData.setAge25to29(row.getCell(8)
								.getNumericCellValue());
						eXLSXSampleData.setAge30to34(row.getCell(9)
								.getNumericCellValue());
						eXLSXSampleData.setAge35to39(row.getCell(10)
								.getNumericCellValue());
						eXLSXSampleData.setAge40to44(row.getCell(11)
								.getNumericCellValue());
						eXLSXSampleData.setAge45to49(row.getCell(12)
								.getNumericCellValue());
						eXLSXSampleData.setAge50to54(row.getCell(13)
								.getNumericCellValue());
						eXLSXSampleData.setAge55to59(row.getCell(14)
								.getNumericCellValue());
						eXLSXSampleData.setAge60to64(row.getCell(15)
								.getNumericCellValue());
						eXLSXSampleData.setAge65to69(row.getCell(16)
								.getNumericCellValue());
						eXLSXSampleData.setAge70to74(row.getCell(17)
								.getNumericCellValue());
						eXLSXSampleData.setAge75to79(row.getCell(18)
								.getNumericCellValue());
						eXLSXSampleData.setAge80to84(row.getCell(19)
								.getNumericCellValue());
						eXLSXSampleData.setAge85to89(row.getCell(20)
								.getNumericCellValue());
						eXLSXSampleData.setAge90toOver(row.getCell(21)
								.getNumericCellValue());
					listXLSXSamepleData.add(eXLSXSampleData);
	
				}			
				
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelAndView.addObject("listXLSXSamepleData", listXLSXSamepleData);
		modelAndView.addObject("XLSXcolName", XLSXcolName);		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/user/primaryProfile")
	public ModelAndView PrimaryProfile() {
		ModelAndView modelAndView = new ModelAndView("Primary_Profile");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/getSchoolname", method = RequestMethod.GET)
	public @ResponseBody List<String> getSchoolname() {
		//logger.debug("getSchoolname");
		List<String> ListSchoolname = new ArrayList<String>();
		String temp = null;
		 
		try {
			BufferedReader br = new BufferedReader(new FileReader("C:\\data\\Schoolname.txt"));
			
			while ((temp = br.readLine())!=null){
				ListSchoolname.add(temp);
			}
			br.close();
				
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ListSchoolname;
	}

	@RequestMapping(value = "/getSchoolData", method = RequestMethod.GET)
	public @ResponseBody List<Double> getSchoolData(			
			@RequestParam(value = "sSchoolNameText", required = true) String sSchoolNameText) {
		logger.debug("getSchoolData");
		//ModelAndView modelAndView = new ModelAndView("Primary_Profile");
		List<Double> ProfileData = new ArrayList<Double>();
		DecimalFormat df = new DecimalFormat("##.##");
		
		try {
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\"+sSchoolNameText+".xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(0);
		
			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(16).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(18).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(19).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(25).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(25).getCell(2).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(25).getCell(3).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(25).getCell(4).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(26).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(26).getCell(2).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(26).getCell(3).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(26).getCell(4).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(29).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(29).getCell(2).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(30).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(30).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(32).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(32).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(33).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(33).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(35).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(35).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(36).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(36).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(40).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(40).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(41).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(41).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(42).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(42).getCell(2).getNumericCellValue())));	
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(45).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(45).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(46).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(46).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(49).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(49).getCell(2).getNumericCellValue())));			
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(50).getCell(1).getNumericCellValue())));
			ProfileData.add(Double.parseDouble(df.format(sheet.getRow(50).getCell(2).getNumericCellValue())));			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//modelAndView.addObject("ProfileData", ProfileData);		
		System.out.println("Get School data =>" + ProfileData.get(0));
		System.out.println("Get School data =>" + ProfileData.get(1));
		
		//ethnicdata = getTableData(Filename,14,6,25,0,1,9);	
		
		return ProfileData;
	}


	@RequestMapping(value = "/getChartData", method = RequestMethod.GET)
	public @ResponseBody List<ChartData> getChartData(
			@RequestParam(value = "sSchoolNameText", required = true) String sSchoolNameText) {
		logger.debug("getChartData");
		List<ChartData> listChartData = new ArrayList<ChartData>();
		String dataname = "";
		List<Double> listData;
		try {
		
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\"+sSchoolNameText+".xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(3);
			
					
			for (int rowi = 6; rowi <= 7; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=10; col++) {
					listData.add(sheet.getRow(rowi).getCell(col).getNumericCellValue()*100);
				}
				listChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return listChartData;
	}
	
	
	@RequestMapping(value = "/user/Ethnicity/{schoolname}", method = RequestMethod.GET)
	public ModelAndView Ethnicity(@PathVariable("schoolname") String schoolname) {
		ModelAndView modelAndView = new ModelAndView("Ethnicity");
		ArrayList<TableData> ethnicdata = new ArrayList<TableData>(); // Column_Name		
		String Filename = "C:\\data\\"+schoolname+".xlsx";
		ethnicdata = getTableData(Filename,14,6,25,0,1,9);				
		System.out.println("Size ==> " + ethnicdata.get(0).getData().size());
		modelAndView.addObject("EthnicData", ethnicdata);	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	@RequestMapping(value = "/user/Nationality/{schoolname}", method = RequestMethod.GET)
	public ModelAndView Nationality(@PathVariable("schoolname") String schoolname) {
		ModelAndView modelAndView = new ModelAndView("Nationality");
		ArrayList<TableData> nationalitydata = new ArrayList<TableData>(); // Column_Name		
		String Filename = "C:\\data\\"+schoolname+".xlsx";
		nationalitydata = getTableData(Filename,15,6,13,0,1,9);				
		System.out.println("Size ==> " + nationalitydata.get(0).getData().size());
		modelAndView.addObject("Nationality", nationalitydata);	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	@RequestMapping(value = "/user/Occupancy/{schoolname}", method = RequestMethod.GET)
	public ModelAndView Occupancy(@PathVariable("schoolname") String schoolname) {
		ModelAndView modelAndView = new ModelAndView("Occupancy");
		ArrayList<TableData> Occupancydata = new ArrayList<TableData>(); // Column_Name	
		System.out.println("schoolname ==>" +schoolname);
		String Filename = "C:\\data\\"+schoolname+".xlsx";
		Occupancydata = getTableData(Filename,2,7,53,0,1,3);				
		System.out.println("Size ==> " + Occupancydata.get(0).getData().size());
		modelAndView.addObject("Occupancy", Occupancydata);	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	@RequestMapping(value = "/user/Attendance/{schoolname}", method = RequestMethod.GET)
	public ModelAndView getAttendancepage(@PathVariable("schoolname") String schoolname){
		logger.debug("getAttendanceData");		
		ModelAndView modelAndView = new ModelAndView("Attendance");	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/getAttendanceData", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ArrayList<ChartData>> getAttendanceData(
			@RequestParam(value = "sSchoolNameText", required = true) String sSchoolNameText) {
		logger.debug("getAttendanceData");
		System.out.println("Hello from getAttendanceData schoolname ==>" +sSchoolNameText);
		
		DecimalFormat df = new DecimalFormat("##.##");		
		ArrayList<ChartData> singlelistChartData = new ArrayList<ChartData>();
		ArrayList<ArrayList<ChartData>> attendaceData = new ArrayList<ArrayList<ChartData>>();
		String dataname = "";
		List<Double> listData;
		
		try {
		
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\"+sSchoolNameText+".xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(7);
			
					
			for (int rowi = 5; rowi <= 6; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=12; col++) {
					listData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(col).getNumericCellValue())));
				}
				singlelistChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}
			attendaceData.add(singlelistChartData);
			singlelistChartData = new ArrayList<ChartData>();			
			for (int rowi = 29; rowi <= 30; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=12; col++) {
					listData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(col).getNumericCellValue())));
				}
				singlelistChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}
			
			attendaceData.add(singlelistChartData);
			singlelistChartData = new ArrayList<ChartData>();
			for (int rowi = 52; rowi <= 53; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=12; col++) {
					listData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(col).getNumericCellValue())));
				}
				singlelistChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}
			attendaceData.add(singlelistChartData);

			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return attendaceData;
	}
	
	@RequestMapping(value = "/user/Exclusions/{schoolname}", method = RequestMethod.GET)
	public ModelAndView getExclusionpage(@PathVariable("schoolname") String schoolname){
		logger.debug("getExclusionpage");		
		ModelAndView modelAndView = new ModelAndView("Exclusions");	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/getExclusionData", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ArrayList<ChartData>> getExclusionData(
			@RequestParam(value = "sSchoolNameText", required = true) String sSchoolNameText) {
		logger.debug("getExclusionData");
		System.out.println("Hello from getExclusionData schoolname ==>" +sSchoolNameText);
		
		DecimalFormat df = new DecimalFormat("##.##");		
		ArrayList<ChartData> singlelistChartData = new ArrayList<ChartData>();
		ArrayList<ArrayList<ChartData>> exclusionData = new ArrayList<ArrayList<ChartData>>();
		String dataname = "";
		List<Double> listData;
		
		try {
		
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\"+sSchoolNameText+".xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(8);
			
					
			for (int rowi = 5; rowi <= 6; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=15; col++) {
					listData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(col).getNumericCellValue())));
				}
				singlelistChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}
			exclusionData.add(singlelistChartData);
			singlelistChartData = new ArrayList<ChartData>();			
			for (int rowi = 30; rowi <= 31; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=15; col++) {
					listData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(col).getNumericCellValue())));
				}
				singlelistChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}
		
			exclusionData.add(singlelistChartData);

			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return exclusionData;
	}
	
	@RequestMapping(value = "/user/SchoolRoll/{schoolname}", method = RequestMethod.GET)
	public ModelAndView getSchoolRollpage(@PathVariable("schoolname") String schoolname){
		logger.debug("getSchoolRollpage");		
		ModelAndView modelAndView = new ModelAndView("SchoolRoll");	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/getSchoolRollData", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ChartData> getSchoolRollData(
			@RequestParam(value = "sSchoolNameText", required = true) String sSchoolNameText) {
		logger.debug("getSchoolRollData");
		System.out.println("Hello from getSchoolRollData schoolname ==>" +sSchoolNameText);
		
		DecimalFormat df = new DecimalFormat("##.##");		
		ArrayList<ChartData> singlelistChartData = new ArrayList<ChartData>();
		
		String dataname = "";
		Double temp=null;
		List<Double> listData;
		
		try {
		
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\"+sSchoolNameText+".xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(1);
			
					
			for (int rowi = 27; rowi <= 28; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=22; col++) {
					temp = Double.parseDouble(df.format(sheet.getRow(rowi).getCell(col).getNumericCellValue()));
					if (temp ==0)
						listData.add(null);
					else
						listData.add(temp);
				}
				singlelistChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}		

			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return singlelistChartData;
	}
	
	
	@RequestMapping(value = "/user/Violent/{schoolname}", method = RequestMethod.GET)
	public ModelAndView getViolentpage(@PathVariable("schoolname") String schoolname){
		logger.debug("getSchoolRollpage");		
		ModelAndView modelAndView = new ModelAndView("Violent");	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/getViolentData", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ChartData> getViolentData(
			@RequestParam(value = "sSchoolNameText", required = true) String sSchoolNameText) {
		logger.debug("getViolentData");
		System.out.println("Hello from getViolentData schoolname ==>" +sSchoolNameText);
		
		DecimalFormat df = new DecimalFormat("##.##");		
		ArrayList<ChartData> singlelistChartData = new ArrayList<ChartData>();
		
		String dataname = "";
		List<Double> listData;
		
		try {
		
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\"+sSchoolNameText+".xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(9);
			
					
			for (int rowi = 6; rowi <= 7; rowi++) {
				listData = new ArrayList<Double>();
				dataname = sheet.getRow(rowi).getCell(0).getStringCellValue();
				for (int col =1; col<=14; col++) {
						listData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(col).getNumericCellValue())));
				}
				singlelistChartData.add(new ChartData(dataname, listData));
				System.out.println("Get Chart name =>" + dataname);
				System.out.println("Get Chart data =>" + listData.get(1));
			}		

			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return singlelistChartData;
	}
	
	@RequestMapping(value = "/user/SIMD/{schoolname}", method = RequestMethod.GET)
	public ModelAndView getSIMDpage(@PathVariable("schoolname") String schoolname){
		logger.debug("getSIMDpage");		
		ModelAndView modelAndView = new ModelAndView("SIMD");	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}

	@RequestMapping(value = "/user/PIPS/{schoolname}", method = RequestMethod.GET)
	public ModelAndView getPIPSpage(@PathVariable("schoolname") String schoolname){
		logger.debug("getPIPSpage");		
		ModelAndView modelAndView = new ModelAndView("PIPS");	
		modelAndView.addObject("SchoolName", schoolname);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/getPIPSData", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ArrayList<ChartData>> getPIPSData(
			@RequestParam(value = "sSchoolNameText", required = true) String sSchoolNameText) {
		logger.debug("getPIPSData");
		System.out.println("Hello from getPIPSData schoolname ==>" +sSchoolNameText);
		
		DecimalFormat df = new DecimalFormat("##.##");		
		ArrayList<ChartData> singlelistChartData = new ArrayList<ChartData>();
		ArrayList<ArrayList<ChartData>> pipsData = new ArrayList<ArrayList<ChartData>>();
		List<Double> listSchoolStartData,listSchoolEndData,listAbdnStartData,listAbdnEndData;
		
		try {
		
			InputStream xlsxFileToRead = new FileInputStream(
					"C:\\data\\"+sSchoolNameText+".xlsx");
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(6);
			
			// get School Start P1 data			
			listSchoolStartData = new ArrayList<Double>();		
			listSchoolEndData = new ArrayList<Double>();	
			listAbdnStartData = new ArrayList<Double>();	
			listAbdnEndData = new ArrayList<Double>();	
			
			for (int rowi = 7; rowi <= 40; rowi ++ ) {
				if ((rowi%2)==0 ){
					listSchoolStartData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(1).getNumericCellValue())));
					listSchoolEndData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(2).getNumericCellValue())));
				}else{					
					listAbdnStartData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(1).getNumericCellValue())));
					listAbdnEndData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(2).getNumericCellValue())));					
				}
					System.out.print(rowi+",");
			}
			singlelistChartData.add(new ChartData("School Start P1", listSchoolStartData)); // add School Start P1 data into list
			singlelistChartData.add(new ChartData("School End P1", listSchoolEndData)); // add School Start P1 data into list
			singlelistChartData.add(new ChartData("Aberdeen Start P1", listAbdnStartData)); // add School Start P1 data into list
			singlelistChartData.add(new ChartData("Aberdeen End P1", listAbdnEndData)); // add School Start P1 data into list
			pipsData.add(singlelistChartData);
			// reset list
			singlelistChartData = new ArrayList<ChartData>();	
			listSchoolStartData = new ArrayList<Double>();		
			listSchoolEndData = new ArrayList<Double>();	
			listAbdnStartData = new ArrayList<Double>();	
			listAbdnEndData = new ArrayList<Double>();	
			
			for (int rowi = 48; rowi <= 81; rowi ++ ) {
				if ((rowi%2)==0 ){
					listSchoolStartData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(1).getNumericCellValue())));
					listSchoolEndData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(2).getNumericCellValue())));
				}else{					
					listAbdnStartData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(1).getNumericCellValue())));
					listAbdnEndData.add(Double.parseDouble(df.format(sheet.getRow(rowi).getCell(2).getNumericCellValue())));					
				}
					System.out.print(rowi+",");
			}
			singlelistChartData.add(new ChartData("School Start P1", listSchoolStartData)); // add School Start P1 data into list
			singlelistChartData.add(new ChartData("School End P1", listSchoolEndData)); // add School Start P1 data into list
			singlelistChartData.add(new ChartData("Aberdeen Start P1", listAbdnStartData)); // add School Start P1 data into list
			singlelistChartData.add(new ChartData("Aberdeen End P1", listAbdnEndData)); // add School Start P1 data into list
			pipsData.add(singlelistChartData);
			
			

						
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pipsData;
	}
	public ArrayList<TableData> getTableData(String fileName, int sheetindex, int rowstart, int rowend, int colname, int coldstart, int coldend){
		
		String columnname = "";
		DecimalFormat df = new DecimalFormat("##.##");		
		ArrayList<TableData> Tabledata = new ArrayList<TableData>(); // Column_Name		
		ArrayList<Double> data = new ArrayList<Double>(); // Column_Name
		try {
			InputStream xlsxFileToRead = new FileInputStream(fileName);
			XSSFWorkbook wb = new XSSFWorkbook(xlsxFileToRead);
			XSSFSheet sheet = wb.getSheetAt(sheetindex);
			
			for (int i = rowstart;i<=rowend;i++ ){
				data = new ArrayList<Double>();
				columnname = sheet.getRow(i).getCell(colname).getStringCellValue();
				for (int j=coldstart;j<=coldend;j++){
					data.add(Double.parseDouble(df.format(sheet.getRow(i).getCell(j).getNumericCellValue())));
				}
				Tabledata.add(new TableData(columnname, data));
			}			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return Tabledata;
		
	}
}
