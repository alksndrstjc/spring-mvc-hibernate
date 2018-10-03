package com.nicat.spring.Entity;

import javax.persistence.*;

@Entity
@Table(name = "recipes")
public class Recipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_recipe")
    private int id_recipe;
    @Column(name = "name")
    private String name;
    @Column(name = "brief_description")
    private String briefDescription;
    @Column(name = "description")
    private String description;
    @Column(name = "img_file_path")
    private String imgFilePath;
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "id_user")
    private User user;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_ingredient")
    private Ingredient ingredient;

    public Recipe() {
    }

    public Recipe(String name, String briefDescription, String description, String imgFilePath) {
        this.name = name;
        this.briefDescription = briefDescription;
        this.description = description;
        this.imgFilePath = imgFilePath;
    }

    public int getId_recipe() {
        return id_recipe;
    }

    public void setId_recipe(int id_recipe) {
        this.id_recipe = id_recipe;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBriefDescription() {
        return briefDescription;
    }

    public void setBriefDescription(String briefDescription) {
        this.briefDescription = briefDescription;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgFilePath() {
        return imgFilePath;
    }

    public void setImgFilePath(String imgFilePath) {
        this.imgFilePath = imgFilePath;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }

}
