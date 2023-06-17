package com.ssi.abpp.Service;

import com.ssi.abpp.dao.DocumentDAO;
import com.ssi.abpp.entity.Document;
import org.springframework.stereotype.Service;

@Service
public class DocumentService {
    private final DocumentDAO documentDAO;

    public DocumentService(DocumentDAO documentDAO) {
        this.documentDAO = documentDAO;
    }

    public Integer createDocument(Document document) {
        // Validate the document content, if needed
        return documentDAO.createDocument(document);
    }

    public Document getDocument(Integer id) {
        return documentDAO.getDocument(id);
    }

    public boolean updateDocument(Integer id, Document document) {
        // Validate the document content, if needed
        return documentDAO.updateDocument(id, document);
    }

    public boolean deleteDocument(Integer id) {
        return documentDAO.deleteDocument(id);
    }
}
