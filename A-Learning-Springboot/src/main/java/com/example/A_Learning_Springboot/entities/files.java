package com.example.A_Learning_Springboot.entities;

import java.io.File;

public class files {
    private String name;
    private String url;
    private File file;

    public files(String name, String url, File file) {
        this.name = name;
        this.url = url;

        this.file = file;
    }

    public String getName() {
        return name;
    }

    public String getUrl() {
        return url;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }
}
