CREATE TABLE dbo.Categories (
    Id INT PRIMARY KEY,
    CategoryName NVARCHAR(255) NOT NULL
);

CREATE TABLE dbo.Products (
    Id INT PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE dbo.ProductsCategories (
    ProductId INT,
    CategoryId INT,
    PRIMARY KEY (ProductId, CategoryId),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);


INSERT INTO dbo.Categories (Id, CategoryName) VALUES
(1, 'Cars'),
(2, 'Car Parts');


INSERT INTO dbo.Products (Id, ProductName, Price) VALUES
(1, 'Mazda mx5 miata', 25000),
(2, 'Engine Oil 5w40', 15.99),
(3, 'Something else', 1);

INSERT INTO dbo.ProductsCategories (ProductId, CategoryId) VALUES
(1, 1),
(2, 2);

select * from  dbo.ProductsCategories

SELECT ProductName, CategoryName from dbo.ProductsCategories pc
JOIN dbo.Categories c on pc.CategoryId = c.Id
RIGHT JOIN dbo.Products p on pc.ProductId = p.Id