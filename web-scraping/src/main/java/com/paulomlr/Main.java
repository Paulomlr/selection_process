package com.paulomlr;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Main {
    public static void main(String[] args) {
        Document document;

        try {
            document = Jsoup.connect("https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos").get();

            String linkAttachment1 = document.select("a[href*=Anexo_I]").attr("href");
            String linkAttachment2 = document.select("a[href*=Anexo_II]").attr("href");

            if (linkAttachment1.isEmpty() || linkAttachment2.isEmpty()) {
                throw new RuntimeException("Unable to find links to Attachment I or Attachment II. Please check the selectors.");
            }

            if(!linkAttachment1.startsWith("http")) linkAttachment1 = "https://www.gov.br" + linkAttachment1;
            if(!linkAttachment2.startsWith("http")) linkAttachment2 = "https://www.gov.br" + linkAttachment2;

            downloadFile(linkAttachment1, "attachment1.pdf");
            downloadFile(linkAttachment2, "attachment2.pdf");

            File file1 = new File("attachment1.pdf");
            File file2 = new File("attachment2.pdf");
            if (!file1.exists() || !file2.exists()) {
                throw new RuntimeException("One of the PDFs did not download correctly.");
            }

            zipFiles("attachments.zip", "attachment1.pdf", "attachment2.pdf");

            System.out.println("Test 1 completed: attachments.zip");

        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (RuntimeException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    public static void downloadFile(String fileUrl, String outputPath) throws IOException {
        try(InputStream in = new URL(fileUrl).openStream(); FileOutputStream out = new FileOutputStream(outputPath)) {
            in.transferTo(out);
            System.out.println("Downloaded file: " + outputPath);
        }
    }

    public static void zipFiles(String zipName, String... files) throws IOException{
        try(ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipName))) {
            for(String file : files) {
                File fileToZip = new File(file);
                if (!fileToZip.exists()) {
                    throw new IOException("File not found: " + file);
                }
                zos.putNextEntry(new ZipEntry(file));
                Files.copy(Path.of(file), zos);
                zos.closeEntry();
                System.out.println("File added to ZIP: " + file);
            }
        }
    }
}