<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Template Designer</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1e1e2f; /* Dark background */
            color: #e0e0e0; /* Light text */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .container {
            display: flex;
            gap: 20px;
            width: 90%;
            max-width: 1200px;
            background-color: #2a2a40; /* Dark container background */
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #34344a; /* Dark sidebar background */
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .sidebar h3 {
            margin: 0 0 15px;
            font-size: 18px;
            color: #ffffff;
            font-weight: 500;
        }

        .search-bar {
            margin-bottom: 15px;
        }

        .search-bar input {
            width: 92%;
            padding: 10px;
            border: 1px solid #444;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            background-color: #2a2a40;
            color: #e0e0e0;
        }

        .search-bar input:focus {
            border-color: #6c5ce7; /* Purple accent */
        }

        .keyword-list {
            max-height: 300px;
            overflow-y: auto;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .keyword-list li {
            padding: 10px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            color: #6c5ce7; /* Purple accent */
            font-weight: 500;
        }

        .keyword-list li:hover {
            background-color: rgba(108, 92, 231, 0.1); /* Light purple hover */
        }

        .divider {
            height: 1px;
            background-color: #444;
            margin: 15px 0;
        }

        .custom-field-section {
            margin-top: 20px;
        }

        .custom-field-section input {
            width: 92%;
            padding: 10px;
            border: 1px solid #444;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            margin-bottom: 10px;
            background-color: #2a2a40;
            color: #e0e0e0;
        }

        .custom-field-section button {
            width: 100%;
            padding: 10px;
            background-color: #6c5ce7; /* Purple accent */
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .custom-field-section button:hover {
            background-color: #5a4dbf; /* Darker purple on hover */
        }

        /* Editor Styles */
        .editor-container {
            flex-grow: 1;
            background-color: #34344a; /* Dark editor background */
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .editor {
            width: 97.5%;
            min-height: 500px; /* Reduced height to accommodate delete surface */
            border: 2px dashed #444;
            position: relative;
            background-color: #2a2a40;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px; /* Space for delete surface */
        }

        .field {
            position: absolute;
            border: 1px solid #6c5ce7; /* Purple accent */
            padding: 8px 12px;
            cursor: move;
            background: #34344a;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            user-select: none;
            font-size: 14px;
            color: #e0e0e0;
        }

        .field.custom-field {
            border-color: #ff7675; /* Red accent for custom fields */
            color: #ff7675;
        }

        .field:hover {
            border-color: #6c5ce7;
        }

        /* Delete Surface */
        .delete-surface {
            width: 96%;
            padding: 15px;
            background-color: #ff7675; /* Red accent */
            color: white;
            text-align: center;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-surface:hover {
            background-color: #e74c3c; /* Darker red on hover */
        }

        .save-template-btn {
            display: block;
            margin: 20px auto 0;
            padding: 12px 24px;
            background-color: #6c5ce7; /* Purple accent */
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .save-template-btn:hover {
            background-color: #5a4dbf; /* Darker purple on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h3>Keywords</h3>
            <div class="search-bar">
                <input type="text" id="searchInput" placeholder="Search keywords..." oninput="filterKeywords()">
            </div>
            <ul class="keyword-list" id="keywordList">
                <c:forEach var="set" items="${keywordList}">
                    <li onclick="addKeywordField('<c:out value="${set}" />')"><c:out value="${set}" /></li>
                </c:forEach>
            </ul>
            <div class="divider"></div>
            <div class="custom-field-section">
                <input type="text" id="customFieldInput" placeholder="Enter custom field name">
                <button onclick="addCustomField()">Add Custom Field</button>
            </div>
        </div>

        <!-- Editor -->
        <div class="editor-container">
            <h2>Cage Card Template</h2>
            <div class="editor" id="editor"></div>
            <!-- Delete Surface -->
            <div class="delete-surface" id="deleteSurface">
                Drag here to delete
            </div>
            <button class="save-template-btn" onclick="saveTemplate()">Save Template</button>
        </div>
    </div>

    <script>
        let currentField = null;

        // Add a keyword field to the editor (static and non-editable)
        function addKeywordField(label) {
            const field = document.createElement('div');
            field.className = 'field';
            field.textContent = label;
            field.style.left = '50px';
            field.style.top = '50px';
            field.setAttribute('draggable', true);

            // Drag and drop functionality
            field.addEventListener('dragstart', (event) => {
                currentField = field;
                event.dataTransfer.setData('text/plain', JSON.stringify({
                    label: label,
                    x: field.style.left,
                    y: field.style.top
                }));
            });
            field.addEventListener('dragend', () => {
                currentField = null;
            });

            document.getElementById('editor').appendChild(field);
        }

        // Add a custom field (editable and removable)
        function addCustomField() {
            const customName = document.getElementById('customFieldInput').value.trim();
            if (customName) {
                const field = document.createElement('div');
                field.className = 'field custom-field'; // Add a special class for custom fields
                field.textContent = customName;
                field.style.left = '50px';
                field.style.top = '50px';
                field.setAttribute('draggable', true);

                // Drag and drop functionality
                field.addEventListener('dragstart', (event) => {
                    currentField = field;
                    event.dataTransfer.setData('text/plain', JSON.stringify({
                        label: customName,
                        x: field.style.left,
                        y: field.style.top
                    }));
                });
                field.addEventListener('dragend', () => {
                    currentField = null;
                });

                // Edit field on double-click
                field.addEventListener('dblclick', () => {
                    const newText = prompt("Edit custom field text:", field.textContent);
                    if (newText && newText.trim()) {
                        field.textContent = newText.trim();
                    }
                });

                document.getElementById('editor').appendChild(field);
                document.getElementById('customFieldInput').value = ''; // Clear input
            }
        }

        // Filter keywords based on search input
        function filterKeywords() {
            const searchValue = document.getElementById('searchInput').value.toLowerCase();
            const keywordItems = document.querySelectorAll('#keywordList li');
            keywordItems.forEach(item => {
                const text = item.textContent.toLowerCase();
                item.style.display = text.includes(searchValue) ? 'block' : 'none';
            });
        }

        // Drag-and-drop functionality for the editor
        const editor = document.getElementById('editor');
        const deleteSurface = document.getElementById('deleteSurface');

        editor.addEventListener('dragover', (event) => {
            event.preventDefault();
        });

        editor.addEventListener('drop', (event) => {
            event.preventDefault();
            if (currentField) {
                const rect = editor.getBoundingClientRect();
                const x = event.clientX - rect.left - currentField.offsetWidth / 2;
                const y = event.clientY - rect.top - currentField.offsetHeight / 2;
                currentField.style.left = `${x}px`;
                currentField.style.top = `${y}px`;
            }
        });

        // Delete surface functionality
        deleteSurface.addEventListener('dragover', (event) => {
            event.preventDefault();
            deleteSurface.style.backgroundColor = '#e74c3c'; // Highlight delete surface
        });

        deleteSurface.addEventListener('dragleave', () => {
            deleteSurface.style.backgroundColor = '#ff7675'; // Reset delete surface color
        });

        deleteSurface.addEventListener('drop', (event) => {
            event.preventDefault();
            if (currentField) {
                currentField.remove(); // Remove the field
                deleteSurface.style.backgroundColor = '#ff7675'; // Reset delete surface color
            }
        });

        // Save template data
        function saveTemplate() {
            const fields = [];
            document.querySelectorAll('.field').forEach((field) => {
                fields.push({
                    label: field.textContent,
                    x: parseInt(field.style.left),
                    y: parseInt(field.style.top),
                    width: field.offsetWidth,
                    height: field.offsetHeight,
                    isCustom: field.classList.contains('custom-field') // Identify custom fields
                });
            });

            const templateJson = {
                templateName: "Custom_Billing",
                dimensions: { width: 800, height: 600 },
                fields: fields
            };

            fetch('/api/templates', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(templateJson)
            })
                .then(response => response.json())
                .then(data => alert('Template saved successfully!'))
                .catch(error => console.error('Error saving template:', error));
        }
    </script>
</body>
</html>