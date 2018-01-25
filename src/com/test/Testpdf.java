package com.test; 
import java.io.FileOutputStream;
import java.io.IOException;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font; 
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont; 
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class Testpdf { 
	public static void main(String[] args) throws DocumentException, IOException {
		// TODO Auto-generated method stub
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, new FileOutputStream("WebRoot/download/plan/Helloworld.PDF"));
		document.open();	
		BaseFont bfChinese  = BaseFont.createFont("WebRoot/tool/fonts/STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
		com.itextpdf.text.Font  FontChinese = new Font(bfChinese, 12, com.itextpdf.text.Font.NORMAL);
		Paragraph pragraph=new Paragraph("　iText中用文本块(Chunk)、短语(Phrase)和段落(paragraph)处理文本。", FontChinese);
		document.add(pragraph);
		Chunk chunk1 = new Chunk("【文本块】This text is underlined. ", FontChinese);
		document.add(chunk1);
		com.itextpdf.text.pdf.PdfPTable aTable1=new PdfPTable(4);
		aTable1.setHorizontalAlignment(PdfPTable.ALIGN_RIGHT);    
		aTable1.setWidthPercentage(90);
		aTable1.addCell("1");
		aTable1.addCell("2");
		aTable1.addCell("3");
		aTable1.addCell("4"); 
		document.add(aTable1);
		com.itextpdf.text.pdf.PdfPTable aTable2=new PdfPTable(3);  	
		aTable1.setHorizontalAlignment(PdfPTable.ALIGN_CENTER);  
		aTable2.setWidthPercentage(60);
		aTable2.addCell("a");
		aTable2.addCell("bb"); 	 
		PdfPCell c=new PdfPCell(new Phrase("ccc"));
		c.setHorizontalAlignment(PdfPTable.ALIGN_CENTER);  
		aTable2.addCell(c);
		document.add(aTable2);
		document.close();
	}

}
