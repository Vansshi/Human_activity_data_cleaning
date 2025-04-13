# CodeBook for the Human Activity Recognition Using Smartphones Dataset

## **Overview**
This codebook describes the variables, data, and transformations performed to clean and process the Human Activity Recognition dataset collected from the accelerometers of Samsung Galaxy S smartphones.

---

### **Variables**
1. **Subject**:  
   - Identifier for the individual who performed the activity (ranges from 1 to 30).  
2. **Activity**:  
   - The activity performed during data collection, with six categories:  
     - WALKING  
     - WALKING_UPSTAIRS  
     - WALKING_DOWNSTAIRS  
     - SITTING  
     - STANDING  
     - LAYING  

3. **Measurement Variables**:  
   - Extracted mean and standard deviation features from the original dataset. Examples include:  
     - `tBodyAcc-mean()-X`: Mean of body acceleration in the X direction.  
     - `tBodyAcc-std()-Y`: Standard deviation of body acceleration in the Y direction.  
     - `tGravityAcc-mean()-Z`: Mean of gravity acceleration in the Z direction.  

---

### **Transformations**
1. **Merging Datasets**:  
   - Combined training and test datasets into one unified dataset.  

2. **Extracting Relevant Features**:  
   - Selected only features with "mean()" or "std()" in their names for analysis.  

3. **Descriptive Activity Names**:  
   - Replaced numeric activity labels with descriptive names (e.g., `1` → `WALKING`).  

4. **Variable Renaming**:  
   - Modified variable names to be more descriptive (e.g., `tBodyAcc-mean()-X` → `TimeBodyAccelerationMeanX`).  

5. **Creating a Tidy Dataset**:  
   - Generated a second dataset with the average of each variable for each activity and each subject.  

---

### **Units**
- All measurements are normalized and dimensionless values ranging between [-1, 1].

---

### **Notes**
- Original data source: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  
- Missing values were not present in the dataset.
