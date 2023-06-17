package com.ssi.abpp.mapper;

import com.ssi.abpp.entity.Document;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
@Component
public class DocumentRowMapper implements RowMapper<Document> {
    @Override
    public Document mapRow(ResultSet rs, int rowNum) throws SQLException {
        Document department = new Document();
        department.setId(rs.getInt("id"));
        department.setName(rs.getString("name"));

        return department;
    }
}

