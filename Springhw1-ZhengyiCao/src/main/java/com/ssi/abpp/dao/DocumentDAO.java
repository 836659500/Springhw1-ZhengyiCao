package com.ssi.abpp.dao;

import com.ssi.abpp.entity.Document;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class DocumentDAO {
    private final Map<Integer, Document> documentMap;

    public DocumentDAO() {
        this.documentMap = new HashMap<>();
    }

    public Integer createDocument(Document document) {
        // Generate a unique ID for the document
        Integer id = 1;
        document.setId(id);
        documentMap.put(id, document);
        return id;
    }

    public Document getDocument(Integer id) {
        return documentMap.get(id);
    }

    public boolean updateDocument(Integer id, Document document) {
        if (documentMap.containsKey(id)) {
            document.setId(id);
            documentMap.put(id, document);
            return true;
        } else {
            return false;
        }
    }

    public boolean deleteDocument(Integer id) {
        return documentMap.remove(id) != null;
    }
}
