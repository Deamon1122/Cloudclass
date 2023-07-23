#### What is DynamoDB?

```
What is DynamoDB?

    - DynamoDB is a low latency NoSQL database.

Data Models?
    
    - Supports both document and key-value data models. 
    - Supported document formats are JSON, HTMl, and XML

Consistency Models?

    - Eventually Consistent
    - Strongly Consistent
    - DynamoDB Transactions(ACID Transactions)

DynamoDB Features?

    - Consists of Tables, Items, and Attributes

2 Types of Primary Key?

    - Partition Key 
    - Composite Key (Partition Key + Sort Key)
```

#### DynamoDB Access Control 
```
- Fine-Grained Access Control with IAM
- IAM condition parameter
- DynamoDB:LeadingKey allows users to access only the items where Partition key value matches their USER_D.

```

#### DynamoDB Secondary Indexes

```
- Enable fast queries on specific data columns.

- Give you a different view of your data based on alternative partition / sort keys.

- It is important to understand the differences.

```

#### Local Secondary Index Vs Global Seconday Index

```
Local Secondary Index :
    - Same Partition key and different sort key to your table.
    - Must be created when you create your table.

Global Seconday Index :
    - Different Partition Key and Different Sort Key to your table.

    - Can be created any time

```

#### DynamoDB Query 

```
- Query :
    -> Finds items in a Table
        Using only the primary key attribute, you provide the primary key name and a distinct value to search for.

- Results :
    -> Sorted
        Query results are always sorted in ascending order by the sort key if there is one.

- Reverse :
    -> Set ScanIndexForward parameter to False
        This reverses the order of the Query results.
```

#### DynamoDB Scan

```
- A Scan operation examines every item in the table and by default returns all data attributes.

- Use the ProjectionExpression Parameter to refine the results.

- Reduce the impact of a Query or Scan by setting a Smaller Page size which uses fewer read operations.

- Isolate scan operations to specific tables and segregate them from your mission-critical traffic.

- Try parallel scans rahter than the default sequential scan.

- A query operation is generally more efficient than a scan

- Design Tables in a way that you can use the Query, Get, Or BatchGetItem API's.

```

#### DynamoDB Provisioned Throughput
```
Provisioned throughput is measured in capacity units

-> Write Capacity Units
    - 1 X 1 KB write per second

-> Strongly Consistent Reads
    - 1 X 4 KB read per second

-> Eventually Consistent Reads
    - 2 X 4 KB reads per second

```
#### DynamoDB On-Demand Capacity
```
-> Understand the difference 
    - Know when to use each pricing model

-> On-Demand Capacity
    - Unpredictable application traffic.
    - Pay-Per-Use Model

-> Provisioned Capacity
    - Read and Write capacity requirements can be forecasted.
    - Application traffic is consistent or increases gradually

```

#### DynamoDB DAX 

```
-> In-Memory Cache :
    - Provides in-memory caching for DynamoDB tables

-> Improves Response :
    - Improves response times for eventually consistent reads only.

-> Write Operations :
    - Data is written to the cache and the backend store at the same time.

-> API Calls :
    - You point your API calls at the DAX cluster instead of your table

-> Cache Hit :
    - If the item you are querying is in the cache, DAX will return it.

-> Not Suitable :
    - Not suitable for write-intensive applications or applications that require strongly consistent reads.

```

#### DynamoDB TTL

```
-> Time To Live (TTL) :
    - Defines an expiry time for your data.
    - Once expired, an item is marked for deletion

-> Use Cases :
    - Great for removing irrelevant or OLD data, e.g. session data, events logs, and temporary data

-> Helps You Save Money :
    - Reduces the cost of your table by automatically removing data which is no longer relevant.

```
#### DynamoDB Streams 

```
-> Sequence Of Modifications :
    - DynamoDB Streams is a time-ordered sequence of item level modifications in your DynamoDB tables.

-> Encryption and Stored :
    - Data is stored for 24 hours only.

-> Lambda Event Source
    - Can be used as an event source for Lambda, so you can create applications that take actions based on events in your DynamoDB table.

```
#### DynamoDB Exponential Backoff

```
-> Provisioned Throughtput Exceeded
    - ProvisionedThroughputExceededException
    - error means the number of requests is too high

-> Exponential Backoff
    - Exponential backoff improves flow by retrying requests using progressively longer waits.

-> Every AWS SDK
    - Exponential backoff is a feature of every AWS SDK and applies to many services within AWS e.g. S3 Buckets, CloudFormation, SES

```
