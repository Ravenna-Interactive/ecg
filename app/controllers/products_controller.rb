class ProductsController < ApplicationController
   before_filter :find_categories
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    @cat = Category.find(:all)
    @brand = Brand.find(:all)
    
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @cat = Category.find(:all)
    @brand = Brand.find(:all)
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @product.category_id = (params[:category])
    @product.brand_id = (params[:brand]) 
    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])
    @product.category_id = (params[:category])
    @product.brand_id = (params[:brand])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  def products
       # default query if no parameter:
       @products = Category.find(:all, :order => 'created_at DESC').products unless params[:id]
       # otherwise, fetch the requested category:
       @products ||= Category.find_by_name(params[:id], :order => 'created_at DESC').products
   end
end
