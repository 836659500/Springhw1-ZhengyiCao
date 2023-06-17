package com.ssi.abpp.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Document implements Serializable {

    private Integer id;

    private String name;

    public String getContent() {
        return "id: " + id.toString() + ". name: " + name + ".";
    }

}
