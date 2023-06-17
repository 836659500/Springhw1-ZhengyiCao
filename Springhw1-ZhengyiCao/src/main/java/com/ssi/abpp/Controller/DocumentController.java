package com.ssi.abpp.Controller;

import com.ssi.abpp.Service.DocumentService;
import com.ssi.abpp.entity.Document;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/documents")
public class DocumentController {
    private final DocumentService documentService;

    public DocumentController(DocumentService documentService) {
        this.documentService = documentService;
    }

    @PostMapping
    public ResponseEntity<?> createDocument(@RequestBody Document document) {
        try {
            Integer createdDocumentId = documentService.createDocument(document);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdDocumentId);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Invalid JSON format");
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getDocument(@PathVariable("id") Integer id) {
        Document document = documentService.getDocument(id);
        if (document != null) {
            return ResponseEntity.ok(document.getContent());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateDocument(@PathVariable("id") Integer id, @RequestBody Document document) {
        boolean documentExists = documentService.updateDocument(id, document);
        if (documentExists) {
            return ResponseEntity.ok(id);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteDocument(@PathVariable("id") Integer id) {
        boolean documentExists = documentService.deleteDocument(id);
        if (documentExists) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}